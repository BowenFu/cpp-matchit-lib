#include "include/core.h"
#include "include/patterns.h"
#include <map>
using namespace matchit;

template <typename Map, typename Key>
bool contains(Map const& map, Key const& key)
{
    return match(map.find(key))(
        pattern(map.end()) = [] { return false; },
        pattern(_)         = [] { return true; }
    );
}

int main()
{
    printf("%d\n", contains(std::map<int, int>{{1,2}}, 1));
    return 0;
}