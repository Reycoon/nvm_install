#!/bin/bash

echo -e "\033[1m\033[41mСкрипт установки NVM (Node.js) на сервера Reddock (с) a.kiryaev\033[49m\nNVM — это менеджер версий для node.js, предназначенный для установки для каждого пользователя и запускаемый для каждой оболочки.\nВерсия NVM = Версии Node.js\033[22m"

cd ~

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

if [ ! -e ./.profile ]
then
	touch .profile
fi

echo -e '\nNVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> .profile

source ~/.profile

while true
do
	echo -n "Посмотреть список версий NVM(y or n): "
	read answer_1
	if [ $answer_1 == "y" ] || [ $answer_1 == "Y" ]
	then
		nvm list-remote | column
	elif [ $answer_1 == "n" ]
	then
		break
	else
		echo "Введите корректное значение!"
	fi
done

while true
do
	echo -n "Введите версию NVM: "
	read version
	nvm install $version
	exit_code=$?
	if [ $exit_code -eq 0 ]
	then
		break;
	else
		echo "Неверная версия"
	fi
done

echo "Пожалуйста, выполните команду 'source ~/.profile' для работы с Node.js"

exit 0

