
## 基础命令
### add: 暂存
暂存指定文件：
`git add <path>`

暂存所有文件
`git add -A`


### stash
stash 所有修改
`git stash`

stask 修改并添加说明
`git stash save <message>`

列出所有stash: 0~N 依次是最近一次至第一次
`git stash list`

应用最近一次stash: 等价于 `git stash apply 0`
`git stash apply`

应用倒数第二次stash:
`git stash apply 1`


### commit: 提交
提交所有暂存
`git commit -m <message>`

提交空白
`git commit --allow-empty -m <message>`

### checkout: 检出
创建新分支并切出到新分支
`git checkout -b <branch>`

切出到已有分支
`git checkout <branch>`


### branch
列出本地分支
`git branch`

创建新分支
`git branch <branchname>`

重命名分支
`git branch -m <old_branch> <new_branch>`

### merge
合并分支
`git merge <branch_to_merge>`


### pull

### push



### tag

### 当前状态
查看文件状态
`git status`

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