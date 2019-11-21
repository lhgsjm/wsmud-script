// raid.flow
<-stopSSAuto
@toolbar jh
@toolbar skills
//级别上限
@js ($level) = /\d+/.exec($(".obj-money").text())['0']

[if] (Skill) == null
    ($Skill) = '基本拳脚','基本内功','基本轻功','基本招架','基本剑法','基本刀法','基本棍法','基本鞭法','基本暗器','基本杖法'
[if] (lianxi_map) == null
    ($lianxi_map) = 住房-练功房
[if] (chiyao) == null
    ($chiyao) = 否
#input ($Skill)=技能列表,(Skill)
#input ($target_level)=目标技能等级,(level)
#input ($LXBefore)=练习前执行命令(用英文;隔开),(LXBefore)
#select ($lianxi_map)=练习地点,住房-练功房|帮会-练功房,(lianxi_map)
#select ($chiyao)=是否吃冰心丹,是|否,(chiyao)
#config

[if] (arg0) != null
    ($Skill) = (arg0)
[if] (arg1) != null
    ($target_level) = (arg1)
[if] (arg2) != null
    ($lianxi_map) = (arg2)

//获取技能数量
@js ($skill_num) = [(Skill)].length
//传送到练功房
stopstate
$to (lianxi_map)
//练习前执行命令
(LXBefore)
$wait 5000
//循环判断
($num)=0
[while](num) < (skill_num)
    //依次获取技能列表
    @toolbar skills
    @js ($skill_name) = [(Skill)][(num)]
    //获取技能id
    @js ($skilltype) = '(skill_name)'.indexOf('基本')
    [if] (skilltype) != -1
        @js ($skill_id) = $(".base:contains((skill_name))").attr("skid")
    [else]
        [if] (skill_name) == 野兽扑咬
            @js ($skill_id) = $(".base:contains((skill_name))").attr("skid")
        [else]
            @js ($skill_id) = $(".skill:contains((skill_name))").attr("skid")
    @print (skill_id)
    //获取技能目前等级
    @js ($skill_level) = /\d+/.exec($("[skid=(skill_id)]").children(".skill-level").text())['0']
    @print <hig>目前技能等级:</hig><hiy>(skill_level)</hiy><hig>，预计目标等级:</hig><hiy>(target_level)</hiy>
    //判断目前等级和目标等级
    [if] (skill_level) >= (target_level)
         @print (skill_name)<hig>已到达目标等级</hig><hir>(target_level)</hir>
         stopstate
        ($num) = (num) + 1
    [else]
        //判断是否吃药
        [if] (:status food) == false && (chiyao) == 是 && {b冰心丹}? != null
            stopstate
            use {b冰心丹}
        @await 1000
        [if] (:state) != 练习
            lianxi (skill_id)
        @await 1000
        //判断是否用完潜能或者无法学习在发呆
        [if] (:state) == 发呆
            [break]
        @tip 等级提升了
        @await 2000
$zdwk
stopSSAuto->