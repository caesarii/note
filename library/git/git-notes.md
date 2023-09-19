
## 暂存: add, reset, stash, checkout
暂存指定文件：
`git add <path>`

暂存所有文件
`git add -A`

取消暂存
`git reset HEAD <file>`

撤销修改
`git checkout -- <file>`

### stash
stash 所有修改
`git stash`

stash 修改并添加说明
`git stash save <message>`

列出所有stash: 0~N 依次是最近一次至第一次
`git stash list`

应用最近一次stash: 等价于 `git stash apply 0`
`git stash apply`

应用倒数第二次stash:
`git stash apply 1`


### 提交: commit, 
提交所有暂存
`git commit -m <message>`

提交空白
`git commit --allow-empty -m <message>`

提交并修改上次提交信息
`git commmit --amend -m <message>`


### branch
列出本地分支
`git branch`

创建新分支
`git branch <branchname>`

重命名分支
`git branch -m <old_branch> <new_branch>`


### checkout: 检出
切出到已有分支
`git checkout <branch>`

创建新分支并切出到新分支
`git checkout -b <branch>`


### merge
合并分支
`git merge <branch_to_merge>`

## 远程仓库

从远程仓库抓取
`git fetch <remote>`

从远程仓库拉取并尝试合并
`git pull`

推送到远程仓库
`git push <remote> <branch>`


## tag
列出所有tag
`git tag`

用通配符查询标签
`git tag -l 'v2.142.*'`

查看特定tag详情
`git show <tag>`

添加附注tag
`git tag -a <tag> -m <message>`

为指定提交添加tag
`git tag -a <tag>  <commit>`

推送 tag
`git push origin <tag>`

删除tag
`git tag -d <tag>`    


### 当前状态
查看文件状态
`git status`

### git log


### git diff
比较工作区与暂存区
`git diff`

比较工作区与repo
`git diff HEAD` 等价于 `git diff <branch>`

比较暂存区与repo
`git diff --staged`

### .gitignore
![3f5f153c86836bfd167977efa1222bac.png](evernotecid://9D6C7E1A-5328-4E86-B5F1-4A03CCA9B003/appyinxiangcom/8957728/ENResource/p9219)



## 进阶命令

## 概念


### 三种状态与三个区
* untracked: untracked 实际在 git 管理之外
* modified: 工作区(working directory)
* staged: 暂存区(staging area)
* commited: git目录(.git directory)

### .git 目录
* HEAD: 当前被检出的分支或提交
* refs: 指向提交对象的指针
* objects: 数据对象
* index: 暂存区信息
## 原理
1. 键值数据库:
* git 最底层是一个键值对数据库, 即.git/objects.
* objects 存储数据的方式: 以待存储的内容加上一个header(表示类型,  blob/tree/commit), 生成一个40位的校验和, 作为key. 以该key生成目录(前两位)和文件(后38为)存储内存.
* 理论上可以直接用这个数据库存储各版本的文件, 自然这么做是很低效的, 所以实际上存储的是树对象.

2. 树对象
* git 以类似unix文件系统的方式存储内容, 称为树对象
* 树对象由记录组成, 记录是一个哈希值指针, 指向数据对象(blob) 或另一个子树对象
* 数据对象存储文件内容, 树对象存储目录
* 文件改动与树对象
  * 新增一个文件, 在 git add 之后即在暂存区(index) 中创建了一个树对象, 该树包含一个Blob对象, 表示文件.
  * 对文件进行修改, 在 git add 之后将在暂存区创建第二个树对象, 书中包含一个blob对象(该对象如何表示修改,书上没讲清楚, 存疑).
* 基于树对象可以对文件进行存储, 但只记录了文件改动本身, 无法记录改动背景信息, 以及改动之间的关系, 这些信息由提交对象记录

3. 提交对象
* 提交对象包含以下信息
  * 一个顶层树对象, 表示当前项目快照
  * 父提交
  * 提交者信息
  * 时间戳
  * 提交注释
* 提交对象通过父提交表示提交之间的上下文关系, 与提交对象对应的树对象及其相互引用表示文件的改动关系
* 提交对象的存取仍然是基于哈希值 key 的, 这很不方便, git中的 refs 用于映射语义化名称(分支/tag)与commit key.
* refs 的本质就是 refs 目录中的一个文件, 文件名就是语义名称, 文件内容就是 commit key. refs 下的 heads/remotes/tags 依次是本地分支/远程分支和tag.

4. HEAD
* refs 中是一系列的commit(分支/tag等), 但无法区分哪个是当前所在的分支(或最新的提交), 这就是 HEAD 的作用
* HEAD 中的文件内容`ref: refs/heads/master`, 即指向当前分支(也可以说是repo的最新提交)
* 当直接检出一个标签/提交/远程分支时, HEAD中包含是一个哈希值, 此时 HEAD 成为 detached HEAD
   

## 其他
退出vim模式：`:q`

别名
```
git config --global alias.aa 'add -A'
git config --global alias.co checkout
git config --global alias.br branch  
git config --global alias.ci commit
git config --global alias.st status
git config --glboal core.editor vim
```