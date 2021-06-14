#include <array>
#include "matchit/core.h"
#include "matchit/patterns.h"
#include "matchit/expression.h"
using namespace matchit;

template <typename Tuple>
constexpr int32_t detectTuplePattern(Tuple const& tuple)
{
    return match(tuple)
    (
        pattern(ds(2, ooo, 2))  = expr(4),
        pattern(ds(2, ooo))     = expr(3),
        pattern(ds(ooo, 2))     = expr(2),
        pattern(ds(ooo))        = expr(1)
    );
}

static_assert(detectTuplePattern(std::make_tuple(2, 3, 5, 7, 2)) == 4);

int main()
{
    printf("%d\n", detectTuplePattern(std::make_tuple(2, 3, 5, 7, 2)));
    printf("%d\n", detectTuplePattern(std::make_tuple(2, 3, 4, 5, 6)));
    printf("%d\n", detectTuplePattern(std::make_tuple(3, 3, 3, 2)));
    printf("%d\n", detectTuplePattern(std::make_tuple(3, 4, 5, 6, 7)));
    return 0;
}
