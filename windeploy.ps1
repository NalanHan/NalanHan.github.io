#推送网站内容
cd  "d:\hexo"
hexo clean 
hexo g

#推送源文件
git add -A
git commit -m "modify post"
git push  origin source