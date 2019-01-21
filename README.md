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

使用阿里图标库记得要将网络项目中的资源拉下来放入本地，防止无网络无法使用

