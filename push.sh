echo 'PUSH TO GITHUB'
sleep 1;

echo 'REOBFUSCATING'
obfuscator/auto.sh

read -p "What is your commit message: " msg
read -p 'Are you sure you want to push your commits to GitHub?' y
if [[ $y =~ ^(y|Y)$ ]];
then
	git add .
	git commit -m "$msg"
	echo 'PUSHING'
	git push
else
	echo 'CANCELED'
fi