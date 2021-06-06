#include <string>
#include <variant>
#include <array>
#include <any>
#include <iostream>
#include "matchit/core.h"
#include "matchit/patterns.h"
#include "matchit/utility.h"
#include "matchit/expression.h"
using namespace matchit;

template <typename V, typename U>
void compare(V const &result, U const &expected)
{
    if (result == expected)
    {
        printf("Passed!\n");
    }
    else
    {
        printf("Failed!\n");
        if constexpr (std::is_same_v<U, int>)
        {
            std::cout << result << " != " << expected << std::endl;
        }
    }
}

template <typename V, typename U, typename Func>
void testMatch(V const &input, U const &expected, Func matchFunc)
{
    auto const x = matchFunc(input);
    compare(x, expected);
}

bool func1()
{
    return true;
}

int64_t func2()
{
    return 12;
}

void test1()
{

    const auto x = (expr(5) + 5)();
    assert(x == 10);
    static_cast<void>(x);
    const auto y = (_ * 2)(5);
    assert(y == 10);
    static_cast<void>(y);

    auto const matchFunc = [](int32_t input) {
        Id<int> ii;
        volatile int x = 5;
        ii.matchValue((_*_)(x));
        assert(*ii == 25);

        return match(input)(
            pattern(1) = func1,
            pattern(2) = func2,
            pattern(or_(56, 59)) = func2,
            pattern(_ < 0) = expr(-1),
            pattern(_ < 10) = expr(-10),
            pattern(and_(_<17, _> 15)) = expr(16),
            pattern(app(_ * _, _ > 1000)) = expr(1000),
            pattern(app(_ * _, ii)) = expr(ii),
            pattern(ii) = -ii,
            pattern(_) = expr(111));
    };
    testMatch(1, true, matchFunc);
    testMatch(2, 12, matchFunc);
    testMatch(11, 121, matchFunc);   // Id matched.
    testMatch(59, 12, matchFunc);    // or_ matched.
    testMatch(-5, -1, matchFunc);    // meet matched.
    testMatch(10, 100, matchFunc);   // app matched.
    testMatch(100, 1000, matchFunc); // app > meet matched.
    testMatch(5, -10, matchFunc);    // _ < 10 matched.
    testMatch(16, 16, matchFunc);    // and_ matched.
}

void test2()
{
    auto const matchFunc = [](auto &&input) {
        Id<int> i;
        Id<int> j;
        return match(input)(
            pattern(ds('/', 1, 1)) = expr(1),
            pattern(ds('/', 0, _)) = expr(0),
            pattern(ds('*', i, j)) = i * j,
            pattern(ds('+', i, j)) = i + j,
            pattern(_)             = expr(-1));
    };
    testMatch(std::make_tuple('/', 1, 1), 1, matchFunc);
    testMatch(std::make_tuple('+', 2, 1), 3, matchFunc);
    testMatch(std::make_tuple('/', 0, 1), 0, matchFunc);
    testMatch(std::make_tuple('*', 2, 1), 2, matchFunc);
    testMatch(std::make_tuple('/', 2, 1), -1, matchFunc);
    testMatch(std::make_tuple('/', 2, 3), -1, matchFunc);
}

struct A
{
    int a;
    int b;
};
bool operator==(A const lhs, A const rhs)
{
    return lhs.a == rhs.a && lhs.b == rhs.b;
}
void test3()
{
    auto const matchFunc = [](A const &input) {
        Id<int> i;
        Id<int> j;
        Id<A> a;
        // compose patterns for destructuring struct A.
        auto const dsA = [](Id<int> &x) {
            return and_(app(&A::a, x), app(&A::b, 1));
        };
        return match(input)(
            pattern(dsA(i)) = expr(i),
            pattern(_) = expr(-1));
    };
    testMatch(A{3, 1}, 3, matchFunc);
    testMatch(A{2, 2}, -1, matchFunc);
}

enum class Kind
{
    kONE,
    kTWO
};

class Num
{
public:
    virtual ~Num() = default;
    virtual Kind kind() const = 0;
};

class One : public Num
{
public:
    constexpr static auto k = Kind::kONE;
    Kind kind() const override
    {
        return k;
    }
};

class Two : public Num
{
public:
    constexpr static auto k = Kind::kTWO;
    Kind kind() const override
    {
        return k;
    }
};

bool operator==(One const &, One const &)
{
    return true;
}

bool operator==(Two const &, Two const &)
{
    return true;
}

template <Kind k>
auto constexpr kind = app(&Num::kind, k);

template <typename T>
class NumAsPointer
{
public:
    auto operator()(Num const &num) const
    {
        return num.kind() == T::k ? static_cast<T const *>(std::addressof(num)) : nullptr;
    }
};

template <>
class matchit::impl::CustomAsPointer<One> : public NumAsPointer<One>
{
};

template <>
class matchit::impl::CustomAsPointer<Two> : public NumAsPointer<Two>
{
};

void test4()
{
    auto const matchFunc = [](Num const &input) {
        return match(input)(
            pattern(as<One>(_)) = expr(1),
            pattern(kind<Kind::kTWO>) = expr(2),
            pattern(_) = expr(3));
    };
    matchit::impl::AsPointer<Two>()(std::variant<One, Two>{});
    testMatch(One{}, 1, matchFunc);
    testMatch(Two{}, 2, matchFunc);
}

void test5()
{
    auto const matchFunc = [](std::pair<int32_t, int32_t> ij) {
        return match(ij.first % 3, ij.second % 5)(
            pattern(0, 0) = expr(1),
            pattern(0, _ > 2) = expr(2),
            pattern(_, _ > 2) = expr(3),
            pattern(_) = expr(4));
    };
    testMatch(std::make_pair(3, 5), 1, matchFunc);
    testMatch(std::make_pair(3, 4), 2, matchFunc);
    testMatch(std::make_pair(4, 4), 3, matchFunc);
    testMatch(std::make_pair(4, 1), 4, matchFunc);
}

int32_t fib(int32_t n)
{
    assert(n > 0);
    return match(n)(
        pattern(1) = expr(1),
        pattern(2) = expr(1),
        pattern(_) = [n] { return fib(n - 1) + fib(n - 2); });
}

void test6()
{
    compare(fib(1), 1);
    compare(fib(2), 1);
    compare(fib(3), 2);
    compare(fib(4), 3);
    compare(fib(5), 5);
}

void test7()
{
    auto const matchFunc = [](std::pair<int32_t, int32_t> ij) {
        Id<std::tuple<int32_t const &, int32_t const &> > id;
        // delegate at to and_
        auto const at = [](auto &&id, auto &&pattern) {
            return and_(id, pattern);
        };
        return match(ij.first % 3, ij.second % 5)(
            pattern(0, _ > 2) = expr(2),
            pattern(ds(1, _ > 2)) = expr(3),
            pattern(at(id, ds(_, 2))) = [&id] {assert(std::get<1>(*id) == 2); static_cast<void>(id); return 4; },
            pattern(_) = expr(5));
    };
    testMatch(std::make_pair(4, 2), 4, matchFunc);
}

void test8()
{
    auto const equal = [](std::pair<int32_t, std::pair<int32_t, int32_t> > ijk) {
        Id<int32_t> x;
        return match(ijk)(
            pattern(ds(x, ds(_, x))) = expr(true),
            pattern(_) = expr(false));
    };
    testMatch(std::make_pair(2, std::make_pair(1, 2)), true, equal);
    testMatch(std::make_pair(2, std::make_pair(1, 3)), false, equal);
}

// optional
void test9()
{
    auto const optional = [](auto const &i) {
        Id<int32_t> x;
        return match(i)(
            pattern(some(x)) = expr(true),
            pattern(none) = expr(false));
    };
    testMatch(std::make_unique<int32_t>(2), true, optional);
    testMatch(std::unique_ptr<int32_t>{}, false, optional);
    testMatch(std::make_optional<int32_t>(2), true, optional);
    testMatch(std::optional<int32_t>{}, false, optional);
    int32_t *p = nullptr;
    testMatch(p, false, optional);
    int a = 3;
    testMatch(&a, true, optional);
}

struct Shape
{
    virtual bool is() = 0;
    virtual ~Shape() = default;
};
struct Circle : Shape
{
    bool is()
    {
        return false;
    }
};
struct Square : Shape
{
    bool is()
    {
        return false;
    }
};

bool operator==(Shape const&, Shape const&)
{
    return true;
}

void test10()
{
    static_assert(matchit::impl::CanReset<Shape, Shape&>::value);
    static_assert(matchit::impl::CanReset<Shape const, Shape const&>::value);

    Id<Shape> s;
    Circle c{};
    Shape& cc = c;
    s.matchValue(cc);
    auto const dynCast = [](auto const &i) {
        return match(i)(
            pattern(some(as<Circle>(_))) = expr("Circle"),
            pattern(some(as<Square>(_))) = expr("Square"),
            pattern(none) = expr("None"));
    };

    testMatch(std::make_unique<Square>(), "Square", dynCast);
    testMatch(std::make_unique<Circle>(), "Circle", dynCast);
    testMatch(std::unique_ptr<Circle>(), "None", dynCast);
}

void test11()
{
    auto const getIf = [](auto const &i) {
        return match(i)(
            pattern(as<Square>(_)) = expr("Square"),
            pattern(as<Circle>(_)) = expr("Circle"));
    };

    using Value = std::variant<Square, Circle>;
    using Pattern = matchit::impl::Meet<matchit::impl::AsPointer<Square> >;
    static_assert(matchit::impl::MatchFuncDefinedV<Value, Pattern>);

    std::variant<Square, Circle> sc = Square{};
    testMatch(sc, "Square", getIf);
    sc = Circle{};
    testMatch(sc, "Circle", getIf);
}

void test12()
{
    compare(matchPattern(std::array<int, 2>{1, 2}, ds(ooo(_), _)), true);
    compare(matchPattern(std::array<int, 3>{1, 2, 3}, ds(ooo(_), _)), true);
    Id<int> x;
    compare(matchPattern(std::array<int, 2>{1, 2}, ds(ooo(x), _)), true);
}

template <size_t I>
constexpr auto& get(A const &a)
{
    if constexpr (I == 0)
    {
        return a.a;
    }
    else if constexpr (I == 1)
    {
        return a.b;
    }
}

namespace std
{
    template <>
    class tuple_size<A> : public std::integral_constant<size_t, 2>
    {
    };
} // namespace std

void test13()
{
    auto const dsAgg = [](auto const &v) {
        Id<int> i;
        return match(v)(
            pattern(ds(1, i)) = expr(i),
            pattern(ds(_, i)) = expr(i));
    };

    testMatch(A{1, 2}, 2, dsAgg);
    testMatch(A{3, 2}, 2, dsAgg);
    testMatch(A{5, 2}, 2, dsAgg);
    testMatch(A{2, 5}, 5, dsAgg);
}

void test14()
{
    auto const anyCast = [](auto const &i) {
        return match(i)(
            pattern(as<Square>(_)) = expr("Square"),
            pattern(as<Circle>(_)) = expr("Circle"));
    };

    std::any sc;
    sc = Square{};
    testMatch(sc, "Square", anyCast);
    sc = Circle{};
    testMatch(sc, "Circle", anyCast);

    compare(matchPattern(sc, as<Circle>(_)), true);
    compare(matchPattern(sc, as<Square>(_)), false);
    // one would write if let like
    // if (matchPattern(value, pattern))
    // {
    //     ...
    // }
}

void test15()
{
    auto const optional = [](auto const &i) {
        Id<char> c;
        return match(i)(
            pattern(none) = expr(1),
            pattern(some(none)) = expr(2),
            pattern(some(some(c))) = expr(c));
    };
    char const **x = nullptr;
    char const *y_ = nullptr;
    char const **y = &y_;
    char const *z_ = "x";
    char const **z = &z_;

    testMatch(x, 1, optional);
    testMatch(y, 2, optional);
    testMatch(z, 'x', optional);
}

void test16()
{
    auto const notX = [](auto const &i) {
        return match(i)(
            pattern(not_(or_(1, 2))) = expr(3),
            pattern(2) = expr(2),
            pattern(_) = expr(1));
    };
    testMatch(1, 1, notX);
    testMatch(2, 2, notX);
    testMatch(3, 3, notX);
}

// when
void test17()
{
    auto const whenX = [](auto const &x) {
        Id<int32_t> i, j;
        return match(x)(
            pattern(i, j).when(i + j == 10) = expr(3),
            pattern(_ < 5, _) = expr(5),
            pattern(_) = expr(1));
    };
    testMatch(std::make_pair(1, 9), 3, whenX);
    testMatch(std::make_pair(1, 7), 5, whenX);
    testMatch(std::make_pair(7, 7), 1, whenX);
}

void test18()
{
    auto const idNotOwn = [](auto const &x) {
        Id<int32_t> i;
        return match(x)(
            pattern(i).when(i == 5) = expr(1),
            pattern(_) = expr(2));
    };
    testMatch(1, 2, idNotOwn);
    testMatch(5, 1, idNotOwn);
}

void test19()
{
    auto const matchFunc = [](auto &&input) {
        Id<int> j;
        return match(input)(
            // `... / 2 3`
            pattern(ds(ooo(_), '/', 2, 3)) = expr(1),
            // `/ ... 3`
            pattern(ds('/', ooo(_), ooo(_), 3)) = expr(2),
            // `... 3`
            pattern(ds(ooo(_), 3)) = expr(3),
            // `/ ...`
            pattern(ds('/', ooo(_))) = expr(4),

            pattern(ds(ooo(j))) = expr(222),
            // `3 3 3 3 ..` all 3
            pattern(ds(ooo(3))) = expr(333),

            // `... / ... 3 ...`
            pattern(ds(ooo(_), '/', ooo(_), 3, ooo(_))) = expr(5),

            // This won't compile since we do compile-time check unless `Seg` is detected.
            // pattern(ds(_, "123", 5)) = expr(1),
            // This will compile
            pattern(ds(ooo(_), "123", 5)) = expr(6),

            // `... int 3`
            pattern(ds(ooo(_), j, 3)) = expr(7),
            // `... int 3`
            pattern(ds(ooo(_), or_(j), 3)) = expr(8),

            // `...`
            pattern(ds(ooo(_), ooo(_), ooo(_), ooo(_))) = expr(9), // equal to ds(_)
            pattern(ds(ooo(_), ooo(_), ooo(_))) = expr(10),
            pattern(ds(ooo(_), ooo(_))) = expr(11),
            pattern(ds(ooo(_))) = expr(12),

            pattern(_) = expr(-1));
    };
    testMatch(std::make_tuple('/', 2, 3), 1, matchFunc);
    testMatch(std::make_tuple('/', "123", 3), 2, matchFunc);
    testMatch(std::make_tuple('*', "123", 3), 3, matchFunc);
    testMatch(std::make_tuple('*', "123", 5), 6, matchFunc);
    testMatch(std::make_tuple('[', '/', ']', 2, 2, 3, 3, 5), 5, matchFunc);
    testMatch(std::make_tuple(3, 3, 3, 3, 3), 3, matchFunc);
    compare(matchPattern(std::make_tuple(3, 3, 3, 3, 3), ds(ooo(3))), true);
    compare(matchPattern(std::make_tuple("123", 3, 3, 3, 2), ds("123", ooo(3), 2)), true);
    compare(matchPattern(std::make_tuple("string", 3, 3, 3, 3), ds(ooo(2), 3)), false);
    compare(matchPattern(std::make_tuple(3, 3, 3, 3, 3), ooo(3)), true);
    compare(matchPattern(std::make_tuple(3, 2, 3, 2, 3), ooo(2)), false);
    compare(matchPattern(std::make_tuple(2, 2, 2, 2, 2), ooo(2)), true);
    compare(matchPattern(std::make_tuple("string", 3, 3, 3, 3), ds(ooo(2))), false);
    compare(matchPattern(std::make_tuple("string"), ds(ooo(5))), false);
    // Debug<decltype(ds(ooo(2)))> x;
    compare(matchPattern(std::make_tuple(3, 2, 3, 2, 3), ooo(_ > 0)), true);
    compare(matchPattern(std::make_tuple(3, 2, -3, 2, 3), ooo(_ > 0)), false);
    compare(matchPattern(std::make_tuple(3, 2, 3, 2, 3), ooo(not_(3))), false);
    compare(matchPattern(std::make_tuple(2, 2, 2, 2, 3), ooo(not_(3))), false);
    compare(matchPattern(std::make_tuple(3, 2, 2, 2, 2), ooo(not_(3))), false);
    compare(matchPattern(std::make_tuple(2, 2, 2, 2, 2), ooo(not_(3))), true);
    {
        Id<int> i;
        compare(matchPattern(std::make_tuple(3, 2, 2, 3, 3), ds(ooo(i), ooo(2), ooo(i))), true);
        // Id<int> n;
        // TODO, match on segment variable length with oon(pat, n)
        // compare(matchPattern(std::make_tuple(3, 2, 2, 3, 3), ds(oon(3, n), ooo(2), oon(3, n))), true);
    }
}

void test20()
{
    Id<char> x;
    char y = 'y';
    compare(matchPattern(
                std::make_tuple('+',
                                1,
                                std::make_tuple('^',
                                                std::make_tuple('s', y),
                                                2),
                                std::make_tuple('^',
                                                std::make_tuple('c', y),
                                                2)),
                ds('+',
                   ooo(1),
                   ds('^',
                      ds('s', x),
                      2),
                   ds('^',
                      ds('c', x),
                      2))),
            true);
    compare(matchPattern(
                std::make_tuple('+', 1, std::make_tuple('^', std::make_tuple('s', y), 2)),
                ds('+', 1, ds('^', ds(_, x), 2))),
            true);
    compare(matchPattern(
                std::make_tuple('+', 1, std::make_tuple('^', std::make_tuple('s', y), 2)),
                ds('+', 1, ds('^', ds('s', y), 2))),
            true);
    compare(matchPattern(
                std::make_tuple('+', 1, std::make_tuple('^', std::make_tuple('s', y), 2)),
                ds('+', 1, ds('^', ds('s', x), 2))),
            true);
    assert(matchPattern(2, 2));
}

void test21()
{
    Id<std::string> strA;
    Id<const char *> strB;
    compare(matchPattern(
                "abc",
                strA),
            true);
    compare(matchPattern(
                "abc",
                strB),
            true);
}

int main()
{
    test1();
    test2();
    test3();
    test4();
    test5();
    test6();
    test7();
    test8();
    test9();
    test10();
    test11();
    test12();
    test13();
    test14();
    test15();
    test16();
    test17();
    test18();
    test19();
    test20();
    test21();
    return 0;
}