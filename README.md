#### 生成 requirements
linux:
pip freeze | grep -v "pkg-resources" > requirements.txt

window:
pip freeze > requirements.txt

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

#### 未提交前忽略
忽略权限提交合并请求
git config core.filrMode = false

#### 提交后忽略
比如忽略项目下.idea文件夹下所有xml文件,idea下都是xml文件（我用的webstorm）：

git update-index --assume-unchanged   .idea/*.xml

如果要重新恢复提交，使用如下命令：

git update-index --no-assume-unchanged   .idea/*.xml

使用阿里图标库记得要将网络项目中的资源拉下来放入本地，防止无网络无法使用

#### 常用字段要保存在settings或者配置文件中 ####
从数据库查找数据后要进行拼接的话最好提前在setiings或者另外设置一个配置文件专门存储一些常用字段，方便修改和维护

##### TODO 考虑要将css，js文件压缩，网页加载压缩后的文件

Windows国际化策略： 在Windows下，需要提前安装GNU gettext工具
本地化模板：要导入{% load i18n %}
trans： {% trans "This is the title." %}

blocktrans：{% blocktrans %}This string will have {{ value }} inside.{% endblocktrans %}
翻译文本：
./mkmsgs.sh #需要在.po文件写上翻译
./manage.py compilemessages

str.upper()       # 把所有字符中的小写字母转换成大写字母
str.lower()        # 把所有字符中的大写字母转换成小写字母
str.capitalize()    # 把第一个字母转化为大写字母，其余小写
str.title()          # 把每个单词的第一个字母转化为大写，其余小写 

