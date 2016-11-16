
#!/bin/bash

#Arthur Ribas
#fm.sh
#Orientador Diego Tumelero
#Escola Alcides Maya

#Lista as opcoes diponiveis no sistema

principal() 

{           
    clear               # limpa a tela
    echo ">>>>>>>>>> ESCOLHA A OPÇÃO COM A LETRA EM CAIXA ALTA <<<<<<<<<<"
    echo ""	
    echo "[A] Mostrar a localização atual do usuário no sistema de arquivos"  
    echo "[B] Mostrar o tipo de um arquivo"  
    echo "[C] Criar um diretório"
    echo "[D] Apagar um diretório não vazio"
    echo "[E] ler 2 números e indicar qual é o maior deles e qual é o menor"
    echo "[F] Exibir as últimas linhas de um arquivo"
    echo "[G] Exibir as primeiras linhas de um arquivo"
    echo "[H] Mostrar a localização de um comando específico"
    echo "[I] Mostra um diretório informado pelo usuário em formato de árvore"
    echo "[J] Copiar um arquivo para um outro diretório"
    echo "[K] Mover um arquivo para outro diretório"
    echo "[L] Sair"

    echo

#Usuario deve selecionar uma opção
    echo -n "Qual a opcao desejada ? "
    read opcao          # faz a leitura da variável "opcao", 
                        # que será utilizada no comando case
                        # para indicar qual a opção a ser utilizada

                        # caso o valor da variável "opcao"...
    case $opcao in
        A)              # seja igual a "1", então faça as instruções abaixo
            clear
			localizacao_arquivos
		;;                                
        B)
            clear
			mostrar_tipo_arquivo           
		;; 

        C)
            clear
           	criar_diretorio
		;; 
        D)
            clear
			deletar_diretorio		
		;; 
        E)
            clear
			mostra_maior   
		;;
        F)
			clear
			ultimas_linhas
        ;; 
        G)
            clear
			primeiras_linhas
        ;; 
		G)
            clear
			localizar_comando          
		;; 
        I)
            clear
			diretorio_form_arvore
        ;; 
        J)
            clear
			copiar_arquivo
        ;; 
        K)
            clear
           	mover_arquivo
		;; 
		L)
            clear
            exit ;;

        *)              
            clear
            echo "Opcao desconhecida."
            read pause
            principal   
        ;;
    esac
}







localizacao_arquivos() {             #Localização arquivos
    pwd 
    read pause          #Usado para pausar a execucao do script
    principal           #Volta para a funcao principal
}

mostrar_tipo_arquivo() {             #Mostra se é um arquivo de texto ou shell 
    clear
    echo "digite arquivo"
	read ARQUIVO
	file $ARQUIVO	
    read pause
    principal
}

criar_diretorio() {             #Serve pra criar um diretorio e definir o nome dele 
    clear
    echo "digite o diretorio que quer criar"
	read DIRETORIO
	mkdir $DIRETORIO
    read pause
	principal	
}

deletar_diretorio() {             #Serve para deletar um diretório
    clear
	echo "digite o diretorio que quer deletar"
	read DIRETORIO
	rm -r $DIRETORIO 	
    read pause
    principal
}

mostra_maior() {             #Serve para mostrar o maior entre 2 números
    clear
	echo "digite o primeiro numero"
		read NUMERO1
		echo "digite o segundo numero"
		read NUMERO2
		if [ $NUMERO1 -gt $NUMERO2 ]; then
			
			echo "O numero maior é: " $NUMERO1
		else
			echo "O numero maior é: " $NUMERO2
		fi
	read pause
    principal		
    
}

ultimas_linhas() {             #Serve para mostrar as ultimar linhas de um texto
    clear
	echo "digite o nome do arquivo"
	read ARQUIVO
	echo "digite a quantidade de linha que quer exibir"
	read LINHAS
	tail -$LINHAS $ARQUIVO
    read pause 
	principal	
}

primeiras_linhas() {             #Serve para mostrar as primeiras linhas de um texto
    clear
	echo "digite o nome do arquivo"
	read ARQUIVO
	echo "digite a quantidade de linha que quer exibir"
	read LINHAS
	head -$LINHAS $ARQUIVO
    read pause
	principal	
}

localizar_comando() {             #Serve para mostrar a localizacao de um comando
	clear
    echo "Digite o comando"
	read COMANDO
	which $COMANDO 
    read pause          
    principal           
}

diretorio_form_arvore() {             #Funcao informa a localizacao de um arquivo em formato de árvore
    clear
	echo "Digite o Diretorio"
	read DIRETORIO
	tree $DIRETORIO
    read pause          
    principal           
}

copiar_arquivo() {             #Serve para copiar um arquivo para um local
    clear
	echo "Digite o arquivo que deseja copiar"
	read ARQUIVO
	echo "Digite para onde deseja copiar o arquivo"
	read LOCAL
	cp $ARQUIVO $LOCAL  
    read pause          
    principal           
}

mover_arquivo() {             #Serve pra mover os arquivos
    clear
    echo "Digite o arquivo que deseja mover"
	read ARQUIVO
	echo "Digite para onde deseja mover mais o nome do arquivo"
	read LOCAL
	mv $ARQUIVO $LOCAL  
    read pause          
    principal            
}

opcao_invalida() {      #Opcao invalida
    clear
    echo "Opcao desconhecida."
    read pause
    principal
}

principal  

#fim do script           
