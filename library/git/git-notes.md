
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
### 三种状态有三个区
* untracked: untracked 实际在 git 管理之外
* modified: 工作区(working directory)
* staged: 暂存区(staging area)
* commited: git目录(.git directory)

## 原理


## 其他
退出vim模式：`:q`

别名
```
git config --global alias.co checkout
git config --global alias.br branch  
git config --global alias.ci commit
git config --global alias.st status
git config --glboal core.editor vim
```