C----------------------------------------------------------------------------------------------------------------------------------------
C     Código feito em linguagem Fortran com o objetivo de ler uma tabela de entrada e gerar um arquivo de saída com os dados tratados
C
C             A tabela de entrada contém dados astrofísicos (30 colunas) do Aglomerado Aberto de estrelas NGC188 situado 
C                  na Galáxia Via Láctea. Os dados de saída serão: Magnitude na banda J, índice de cor e Membership
C
C----------------------------------------------------------------------------------------------------------------------------------------

      Program dados
      implicit none
      integer maxi
      parameter (maxi=120000)     ! Tabela de no maximo 120000 linhas
      integer i,j
      character*134 cabecalho1          
      real A(1:maxi,30)           ! Arquivo de entrada. Esta tabela tem 30 colunas e no máximo 120000 linhas (parametro "maxi")
      real indice_cor		  ! Parâmetro astrofisico relacionado com a cor de uma estrela, ou seja, com a sua temperatura superficial


      open(10,file="stetsonS_2mass.dat",status="old")             ! Abrir o arquivo onde está contido os dados de entrada
      open(11,file="stetsonS_2mass_saida.dat",status="unknown")   ! Abrir o arquivo onde será colocado os dados de saída
      rewind 10
      rewind 11

      do j=1,4
       read(10,*) cabecalho1          ! Ler cabeçalho no arquivo de entrada
       write(11,*) cabecalho1         ! Escrever cabecalho no arquivo de saída
      end do

      i=1
      do while(i.le.maxi)
       read(10,*,end=5) A(i,1), A(i,2), A(i,3), A(i,4), A(i,5),        ! Na leitura dos dados da tabela, preciso considerar cada elemento
     &    A(i,6), A(i,7), A(i,8), A(i,9), A(i,10), A(i,11),            ! como sendo uma componente de uma matriz
     &    A(i,12), A(i,13), A(i,14), A(i,15), A(i,16),
     &    A(i,17), A(i,18), A(i,19), A(i,20), A(i,21),
     &    A(i,22), A(i,23), A(i,24), A(i,25), A(i,26),
     &    A(i,27), A(i,28), A(i,29), A(i,30)

c       write(11,7) A(i,1), A(i,2), A(i,3), A(i,4), A(i,5),
c     &    A(i,6), A(i,7), A(i,10), A(i,11), A(i,14),
c     &    A(i,15), A(i,16), A(i,17), A(i,18), A(i,19)

	indice_cor = A(i,24) - A(i,26)                    ! Indice de cor = Medida da temperatura superficial de uma estrela

       write(11,7) A(i,24), indice_cor, A(i,30)           ! A(i,24) = Magnitude da estrela na banda J (Infravermelho)
                                                          ! A(i,30) = Membership: Probabilidade de uma estrela pertencer ao aglomerado

 7      format(1(F6.3,1x), 1(F6.3,1x), 1(F5.1,1x))        ! Formatação dos dados da tabela de saída




c 7      format(1(F8.5,1x), 1(F3.0,1x), 1(F3.0,1x), 1(F6.3,2x),
c     &    1(F3.0,1x), 1(F3.0,1x), 1(F6.3,2x), 1(F10.6,2x),
c     &    1(F10.7,2x), 1(F7.4,2x), 1(F7.4,2x), 1(F7.4,2x),
c     &    1(F7.4,2x), 1(F7.4,2x), 1(F7.4,2x))


       i=i+1
      enddo

 5    close(10)               ! Fechar o arquivo de entrada
      close(11)               ! Fechar o arquivo de saída
      end                     ! Fim do código
