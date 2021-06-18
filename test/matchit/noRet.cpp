#include <gtest/gtest.h>
#include "matchit.h"


using namespace matchit;

TEST(MatchStatement, test)
{
  testing::internal::CaptureStdout();
  match(4)(
      pattern(or_(_ < 0, 2)) = [] { std::cout << "mismatch!"; },
      pattern(_) = [] { std::cout << "match all!"; });
  std::string output = testing::internal::GetCapturedStdout();

  EXPECT_STREQ(output.c_str(), "match all!");
}