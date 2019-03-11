#### 生成 requirements
pip freeze | grep -v "pkg-resources" > requirements.txt

#### git相关操作
创建一个叫做"feature_x"的分支，并切换过去：
git checkout -b feature_x

切换回主分支：
git checkout master

再把新建的分支删掉：
git branch -d feature_x

除非你将分支推送到远端仓库，不然该分支就是 不为他人所见的：
git push origin <branch>
  
合并分支
git merge <branch>
  
创建分支,创建一个叫做 1.0.0 的标签：
git tag 1.0.0 1b2e1d63ff

忽略权限提交合并请求
git config core.filrMode = false

使用阿里图标库记得要将网络项目中的资源拉下来放入本地，防止无网络无法使用

#### 常用字段要保存在settings或者配置文件中 ####
从数据库查找数据后要进行拼接的话最好提前在setiings或者另外设置一个配置文件专门存储一些常用字段，方便修改和维护

##### TODO 考虑要将css，js文件压缩，网页加载压缩后的文件

Windows本地化策略： 在Windows下，需要提前安装GNU gettext工具
本地化模板：要导入{% load i18n %}
trans： {% trans "This is the title." %}

blocktrans：{% blocktrans %}This string will have {{ value }} inside.{% endblocktrans %}