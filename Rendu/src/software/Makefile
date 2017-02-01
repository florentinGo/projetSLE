BIN_DIR =	bin/
OBJ_DIR =	obj/
SRC_DIR =	src/
#a commenter ou decommenter si pc perso ou minatec
#INC_DIR =	/softslin/catapult2011a_200_12/Mgc_home/shared/include/
INC_DIR =       include/
 
#files
BIN =	${BIN_DIR}exec
SRC =	${wildcard ${SRC_DIR}*.cpp}
OBJ =   ${SRC:${SRC_DIR}%.cpp=${OBJ_DIR}%.o}
 
 
#flags
CFLAGS =	-g -w -W -Wall
IFLAGS =	-I${INC_DIR}
 
#Compiler
CC =		g++
 
#rules
all:		${BIN}
 
${BIN}:		${OBJ}
		${CC} $^ -o ${BIN}
 
${OBJ_DIR}%.o:	${SRC_DIR}%.cpp		
		${CC} ${IFLAGS} ${CFLAGS} -c $< -o $@

.PHONY:
	clean 
	cleanimage

clean: 
	rm -f $(OBJ) *.o *.pgm *.jpg obj/*

cleanimage:
	rm *.pgm
