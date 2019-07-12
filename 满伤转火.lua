// raid.flow
// author:四区白三三
// 人名关键词：长老|副帮主|逍遥子|洪七公|张三丰|玄难|岳不群|灭绝
// 伤害百分比：11（武当只需要9）
// 挡刀顺序：想打掌门：打第一个长老；想打第一个长老：打掌门；想打第二个长老：$killall
($id_1) = {r副帮主}?
($id_2) = {r副帮主}?# obj.id == "(id_1)" #
[if] (:room) == 逍遥派-地下石室 && (:combating) == true
    ($id_ban) = {r逍遥子}?
    [if] (id) != (id_1) && (id) != (id_ban)
        kill (id_1);kill (id_1)
        pty 占比(percent)，切换目标：第一个橙
    [else if] (id) == (id_1)
        kill (id_ban);kill (id_ban)
        pty 占比(percent)，切换目标：逍遥子
    [else if] (id) == (id_ban)
        $stoppfm
        pty 逍遥子已满，停手围观
    @until (:combating) == false
    $startpfm
[else if] (:room) == 丐帮-林间小屋 && (:combating) == true
    ($id_ban) = {r洪七公}?
    [if] (id) != (id_1) && (id) != (id_ban)
        kill (id_1);kill (id_1)
        pty 占比(percent)，切换目标：第一个橙
    [else if] (id) == (id_1)
        kill (id_ban);kill (id_ban)
        pty 占比(percent)，切换目标：洪七公
    [else if] (id) == (id_ban)
        $stoppfm
        pty 洪七公已满，停手围观
    @until (:combating) == false
    $startpfm
[else if] (:room) == 武当派-后山小院 && (:combating) == true
    ($id_ban) = {r张三丰}?
    [if] (id) != (id_1) && (id) != (id_ban)
        kill (id_1);kill (id_1)
        pty 占比(percent)，切换目标：第一个橙
    [else if] (id) == (id_1)
        kill (id_ban);kill (id_ban)
        pty 占比(percent)，切换目标：张三丰
    [else if] (id) == (id_ban)
        $stoppfm
        pty 张三丰已满，停手围观
    @until (:combating) == false
    $startpfm
[else if] (:room) == 少林派-方丈楼 && (:combating) == true
    ($id_1) = {r长老}?
    ($id_2) = {r长老}?# obj.id == "(id_1)" #
    ($id_ban) = {r玄难}?
    [if] (id) != (id_1) && (id) != (id_ban)
        kill (id_1);kill (id_1)
        pty 占比(percent)，切换目标：第一个橙
    [else if] (id) == (id_1)
        kill (id_ban);kill (id_ban)
        pty 占比(percent)，切换目标：玄难
    [else if] (id) == (id_ban)
        $stoppfm
        pty 玄难已满，停手围观
    @until (:combating) == false
    $startpfm
[else if] (:room) == 华山派-客厅 && (:combating) == true
    ($id_ban) = {r岳不群}?
    [if] (id) != (id_1) && (id) != (id_ban)
        kill (id_1);kill (id_1)
        pty 占比(percent)，切换目标：第一个橙
    [else if] (id) == (id_1)
        kill (id_ban);kill (id_ban)
        pty 占比(percent)，切换目标：岳不群
    [else if] (id) == (id_ban)
        $stoppfm
        pty 岳不群已满，停手围观
    @until (:combating) == false
    $startpfm
[else if] (:room) == 峨眉派-清修洞 && (:combating) == true
    ($id_ban) = {r灭绝}?
    [if] (id) != (id_1) && (id) != (id_ban)
        kill (id_1);kill (id_1)
        pty 占比(percent)，切换目标：第一个橙
    [else if] (id) == (id_1)
        kill (id_ban);kill (id_ban)
        pty 占比(percent)，切换目标：灭绝
    [else if] (id) == (id_ban)
        $stoppfm
        pty 灭绝已满，停手围观
    @until (:combating) == false
    $startpfm
[else]
    $startpfm