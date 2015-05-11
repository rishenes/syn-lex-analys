#Глобальное объявление
Input = document.getElementById("input-area")
Output = document.getElementById("output-area")
Input.value = ""
Output.value = ""
InputMassive = []
Convol = []
value_command = []

#Инициализация по заданию
Keywords = ["ROWVECTOR", "COLVECTOR", "MATRIX", "PRINT"]  #1 in Convol
Separators = ["(", ",", ")", "=", "+", "-", "*", "^", "@"]  #2 in Convol
Literals = []   #3 in Convol
#Вызовы вспомогательных функций

#       #       #       #
##     ###     ###     ##
###   ### ##   #####   ##
#### ####### ####### ####
#########################
#Логика
console.log("courseos@razumov:~> Let's test!")

streamWords = ->
  stage = Input.value
  num_n = -1
  if event.keyCode is 13
    for word in stage
      for i in [0..word.length]
        if word.charAt(i) is "\n" then num_n++
    InputMassive = stage.split("\n")
    lexicalAnalysis(InputMassive,num_n)
    Convol.push([0,0]) #new command
    syntaxAnalys()

lexicalAnalysis = (arr,n) ->
  word = arr[n]
  console.log(word)
  word = word.replace(/\s+$/, "");
  preResult = ""

  for i in [0..word.length]

    if word.charAt(i) in Separators or word.charAt(i) is ' ' or i is word.length
      iK = isKeyword(preResult,word)
      if iK is off then iL = isLiteral(preResult,word)
      iN = isNumber(preResult,word)
      iS = isSeparator(word.charAt(i),word)

      if iK is on
        preResult = ""
        continue

      if iS is on
        preResult = ""
        continue

      if iL is on
        preResult = ""
        continue

      if iN is on
        preResult = ""
        continue

      if word.charAt(i-1) in Separators then continue
      if word.charAt(i-1) is " " then continue
      if word.charAt(i) is "" then continue

      console.log("undefined symbol")

      preResult = ""

      continue
    preResult += word.charAt(i)

Input.addEventListener('keyup', streamWords, false)

#########################
#Синтаксический анализатор
syntaxAnalys = () ->

  if Convol[0][0] is 1 and Convol[0][1] is 0 #ROW
    if Convol[1][0] is 3 #if literal
      if Literals[Convol[1][1]][1] is off and Literals[Convol[1][1]][3] is off and Literals[Convol[1][1]][5] is off #if unused
        if Convol[2][0] is 2 and Convol[2][1] is 0 #if "("
          if Convol[3][0] is 4 #if num1
            if Convol[4][0] is 2 and Convol[4][1] is 1 #if ","
              if Convol[5][0] is 4 #if num2
                if Convol[6][0] is 2 and Convol[6][1] is 2 #if ")"
                  if Convol[7][0] is 0 #if end of command
                    Literals[Convol[1][1]][5] = "ROWVECTOR"
                    Literals[Convol[1][1]][1] = Convol[3][1]
                    Literals[Convol[1][1]][2] = Convol[5][1]
                    console.log(Convol)
                    console.log(Literals)
                    deleteConvol()

  if Convol[0][0] is 1 and Convol[0][1] is 1
    if Convol[1][0] is 3 #if literal
      if Literals[Convol[1][1]][1] is off and Literals[Convol[1][1]][2] is off and Literals[Convol[1][1]][3] is off #if unused
        if Convol[2][0] is 2 and Convol[2][1] is 0 #if "("
          if Convol[3][0] is 4 #if num1
            if Convol[4][0] is 2 and Convol[4][1] is 1 #if ","
              if Convol[5][0] is 4 #if num2
                if Convol[6][0] is 2 and Convol[6][1] is 2 #if ")"
                  if Convol[7][0] is 0 #if end of command
                    Literals[Convol[1][1]][5] = "COLVECTOR"
                    Literals[Convol[1][1]][1] = Convol[3][1]
                    Literals[Convol[1][1]][2] = Convol[5][1]
                    console.log(Convol)
                    console.log(Literals)
                    deleteConvol()

  if Convol[0][0] is 1 and Convol[0][1] is 2
    if Convol[1][0] is 3 #if literal
      if Literals[Convol[1][1]][1] is off and Literals[Convol[1][1]][2] is off and Literals[Convol[1][1]][3] is off #if unused
        if Convol[2][0] is 2 and Convol[2][1] is 0 #if "("
          if Convol[3][0] is 2 and Convol[3][1] is 0 #if "("
            if Convol[4][0] is 4 #if num1
              if Convol[5][0] is 2 and Convol[5][1] is 1 #if ","
                if Convol[6][0] is 4 #if num2
                  if Convol[7][0] is 2 and Convol[7][1] is 2 #if ")"
                    if Convol[8][0] is 2 and Convol[8][1] is 0 #if "("
                      if Convol[9][0] is 4 #if num3
                        if Convol[10][0] is 2 and Convol[10][1] is 1 #if ","
                          if Convol[11][0] is 4 #if num4
                            if Convol[12][0] is 2 and Convol[12][1] is 2 #if ")"
                              if Convol[13][0] is 2 and Convol[13][1] is 2 #if ")"
                                if Convol[14][0] is 0 #if end of command
                                  Literals[Convol[1][1]][5] = "MATRIX"
                                  Literals[Convol[1][1]][1] = Convol[4][1]
                                  Literals[Convol[1][1]][2] = Convol[6][1]
                                  Literals[Convol[1][1]][3] = Convol[9][1]
                                  Literals[Convol[1][1]][4] = Convol[11][1]
                                  console.log(Convol)
                                  console.log(Literals)
                                  deleteConvol()

  if Convol[0][0] is 1 and Convol[0][1] is 3
    if Convol[1][0] is 2 and Convol[1][1] is 0 #if "("
      if Convol[2][0] is 3 #if literal
        if Convol[3][0] is 2 and Convol[3][1] is 2 #if ")"
          if Convol[4][0] is 0 #if end of command
            for word in Literals
              if word[0] is Literals[Convol[2][1]][0] and Literals[Convol[2][1]][5] isnt off
                console.log("PRINT IS...")                                       ############ DO SOMETHING
                deleteConvol()


  if Convol[0][0] is 3
    for word in Literals
      if word[0] is Literals[Convol[0][1]][0] and Literals[Convol[0][1]][5] is "ROWVECTOR" or Literals[Convol[0][1]][5] is "COLVECTOR"
        if Convol[1][0] is 2 and Convol[1][1] is 0 #if "("
          if Convol[2][0] is 4 and Convol[2][1] is '1' or Convol[2][1] is '2'
            if Convol[3][0] is 2 and Convol[3][1] is 2 #if ")"
              if Convol[4][0] is 0 #if end of command
                console.log("PRINT IS #{Literals[Convol[0][1]][Convol[2][1]]}")
                deleteConvol()
                











#Вспомогательные функции

deleteConvol = () ->
  Convol = []

isKeyword = (str,command) ->
  for word, index in Keywords
    if word is str
      Convol.push([1,index])
      return on
  return off

isNumber = (str,command) ->
  if "0" <= str <= "9"
    Convol.push([4,str])
    value_command.push(str)
    console.log("courseos@razumov:~> " + str + " is number")
    return on
  return off

isSeparator = (str,command) ->
  for word, index in Separators
    if word is str
      Convol.push([2, index])
      console.log("courseos@razumov:~> " + Separators[index] + " is separator")
      return on
  return off

isLiteral = (str,command) ->
  if ("A" <= str <= "Z")
    flag = false
    for word, index in Literals
      if word[0] is str
        Convol.push([3, index])
        console.log("courseos@razumov:~> " + str + " is literal")
        flag = true
    if flag is off
      console.log("courseos@razumov:~> " + str + " is new literal")
      Literals.push([str,off,off,off,off,off]) #name value1 value2 type
      console.log(Literals[0])
      Convol.push([3,Literals.length-1])
    return on
  return off




