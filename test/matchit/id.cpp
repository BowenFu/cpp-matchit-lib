#include <gtest/gtest.h>
#include "matchit/core.h"
#include "matchit/patterns.h"
#include "matchit/utility.h"
#include "matchit/expression.h"
using namespace matchit;

TEST(Id, matchValue)
{
  Id<int32_t> x;
  x.matchValue(1);
  EXPECT_EQ(*x, 1);
}

TEST(Id, resetId)
{
  Id<int32_t> x;
  x.matchValue(1);
  EXPECT_EQ(*x, 1);
  x.reset(1);
  EXPECT_EQ(*x, 1);
  x.reset(0);
  EXPECT_FALSE(x.hasValue());
}

TEST(Id, resetAfterFailure)
{
  Id<int32_t> x;
  Context context;
  matchPattern(10, x, 0, context);
  EXPECT_EQ(*x, 10);
  matchPattern(10, not_(x), 0, context);
  EXPECT_FALSE(x.hasValue());
}

TEST(Id, resetAfterFailure2)
{
  Id<int32_t> x;
  Context context;
  matchPattern(10, and_(x, not_(x)), 0, context);
  EXPECT_FALSE(x.hasValue());
}

TEST(Id, resetAfterFailure3)
{
  Id<int32_t> x;
  Context context;
  matchPattern(10, and_(x, app(_ / 2, x)), 0, context);
  EXPECT_FALSE(x.hasValue());
  matchPattern(10, and_(x, app(_ / 2, not_(x))), 0, context);
  EXPECT_EQ(*x, 10);
  matchPattern(10, or_(and_(not_(x), not_(x)), app(_ / 2, x)), 0, context);
  EXPECT_EQ(*x, 5);
  matchPattern(10, or_(and_(not_(x), x), app(_ / 2, x)), 0, context);
  EXPECT_EQ(*x, 5);
  matchPattern(10, or_(and_(x, not_(x)), app(_ / 2, x)), 0, context);
  EXPECT_EQ(*x, 5);
}

TEST(Id, resetAfterFailure4)
{
  Id<int32_t> x;
  Context context;
  auto const matched =
      matchPattern(std::make_tuple(10, 20),
                   or_(
                       // first / 5 == second / 2 + 1
                       ds(
                           app(_ / 5, x),
                           app(_ / 2 + 1, x)),
                       // first / 2 == second / 5 + 1
                       ds(
                           app(_ / 2, x),
                           app(_ / 5 + 1, x))),
                   0, context);
  EXPECT_TRUE(matched);
  EXPECT_EQ(*x, 5);
}

TEST(Id, resetAfterFailure5)
{
  Id<int32_t> x;
  Context context;
  matchPattern(10, and_(and_(or_(x)), and_(10)), 0, context);
  EXPECT_EQ(*x, 10);
  matchPattern(10, and_(and_(or_(x)), and_(1)), 0, context);
  EXPECT_FALSE(x.hasValue());
}

TEST(Id, matchMultipleTimes)
{
  Id<int32_t> z;
  Context context;
  matchPattern(10, and_(z, z), 0, context);
  EXPECT_EQ(*z, 10);

  Id<std::unique_ptr<int32_t>> x1;
  Id<std::unique_ptr<int32_t>> x2;
  matchPattern(std::make_unique<int32_t>(10), and_(x1, x2), 0, context);
  EXPECT_EQ(*(*x1), 10);
  EXPECT_EQ(*(*x2), 10); // should equal to x1 after fixing the rvalue issue.

  Id<std::unique_ptr<int32_t>> y;
  matchPattern(std::make_unique<int32_t>(10), and_(y), 0, context);
  EXPECT_EQ(*(*y), 10);
}

TEST(Id, AppToId)
{
  Id<int32_t> ii;
  auto const result = match(11)
  (
    pattern(app(_ * _, ii)) = expr(ii)
  );
  EXPECT_EQ(result, 121);
}