// raid.flow
($number)=1
($pos)=初始值
[while] {b藏宝图}? != null
    <---
    ($pos)=null
    use {b藏宝图}?
    @tip 发现上面的图案所绘的方位似乎($pos)。|你找到了
    [if] (pos) == 就在你这里
        use {b藏宝图}?
        [continue]
    [else if] (pos) == null
        [continue]
    --->
    jh fam (number) start
    [if] (pos) != 离你所在的位置挺远的
        // 武当
        [if] (number)=1
            [if] (pos) == 在你的北方
                go north
                go south;go west;go northup;go north;go east
            [else if] (pos) == 在你的西方
                go west
                go west
            [else]
                go west;go northup
                go north
                go west
                go northup
                go northup
                go northup
                [while] (pos) == 在你的北方
                    go north

        // 少林
        [else if] (number)=2
            [if] (pos) == 在你的北方
                go north
                go north
                go northup
                go southdown;go northwest;go northeast
                [while] (pos) == 在你的北方
                    go north
            [else if] (pos) == 在你的西北方向
                go north;go west
                go east;go north;go northwest
                go northeast;go north;go west
                go east;go north;go west
                go east;go north;go west
            [else]
                go north;go east
                go west;go north;go northeast
                go northwest;go north;go east
                go west;go north;go east

        // 华山
        [else if] (number)=3
            [if] (pos) == 在你的北方
                go westup;go north;go east
                go west;go north;go east
            [else if] (pos) == 在你的西北方向
                go westup;go north
                go north
                go north
            [else if] (pos) == 在你的西方
                go westup
                go west
            [else if] (pos) == 在你东方 
                go eastup
            [else if] (pos) == 在你的东南方向
                go eastup;go southup
                jumpdown
                go southup
                go south
                go east
            [else]
                go westup
                go south
                go southup
                go southup
                break bi;go enter
                go westup
                go westup
                jumpup

        // 峨眉
        [else if] (number)=4
            go west;go south;go west
            [if] (pos) == 在你东方
                go east
                go east
                go east
            [else if] (pos) == 在你的西方
                go west
            [else if] (pos) == 在你的南方
                go south
                go south
            [else if] (pos) == 在你的北方
                go north
                go north
            [else if] (pos) == 在你的东北方向
                go east;go north
                go east
                go northup
                go east
            [else]
                go east;go south
                go north;go east;go south

        // 逍遥
        [else if] (number)=5
            [if] (pos) == 在你东方
                go east
            [else if] (pos) == 在你的西方
                go west
            [else if] (pos) == 在你的南方
                go south
                go south
            [else if] (pos) == 在你的北方
                go north
                go north
            [else if] (pos) == 在你的东北方向
                go east;go north
            [else if] (pos) == 在你的东南方向
                go east;go south
                go south
            [else if] (pos) == 在你的西南方向
                go west;go south
            [else]
                go down
                go down

        // 丐帮
        [else]
            [if] (pos) == 在你东方
                go down;go east;go east;go east;go up
                go down;go east;go east;go up
            [else if] (pos) == 在你的南方
                go down
            [else]
                go down;go east
                go east
                go east
                go east
                go east

    [else if] (number)<6
        ($number) = (number) + 1
    [else] 
        ($number)=1
//结束后自动挖矿或者闭关
$wait 1000
@tidyBag
$wait 10000
$zdwk