procedure TForm1.Button1Click(Sender: TObject);
var
  V     : Variant;    // Переменная, в которой создаётся объект MATLAB

  MReal : OleVariant; // При работе с матрицами возвращается
  MImage: OleVariant; // комплексный результат
  // Здесь мы применяем тип OleVariant для СОМ-ориентированной задачи

  i,j   : Integer;    // i - номер строки, j - номер столбца
begin
  try
    V:=CreateOLEObject('Matlab.Application'); // Создание OLE-объекта

    // Создадим матрицу 3x3 значений типа Double, номер строки и столбца
    // меняется от 0 до 2. Эта матрица будет являться вещественной частью
    // результата, возвращаемого MATLAB, в ней будет содержаться инверсия
    // матрицы A
    MReal  := VarArrayCreate([0, 2, 0, 2], varDouble);

    // Мнимая часть нам не потребуется, но она нужна для функции GetFullMatrix
    MImage := VarArrayCreate([0, 2, 0, 2], varDouble);

    // Сформируем матрицу переходных вероятностей, которая может
    // использоваться при моделировании процессов переработки сыпучих
    // материалов и обратим ее
    V.Execute('A=[0.4 0.6 0; 0 0.4 0.6; 0 0 1]; A=inv(A)');

    // Далее следует описание метода GetFullMatrix, взятое с сайта разработчика
    // пакета MATLAB MathWorks Inc.
    // www.mathworks.com/access/helpdesk/help/techdoc/apiref/getfullmatrix.html

    {

    GetFullMatrix(varname As String, workspace As String, [out] MReal As
    Double, [out] MImage As Double)

    GetFullMatrix gets the matrix stored in the variable varname from the
    specified workspace of the MATLAB server and returns the real part in MReal
    and the imaginary part in MImage. The workspace argument can be either base
    or global.

    Example: assign a 5-by-5 real matrix to the variable A in the base
    workspace of the server, and then read it back with GetFullMatrix.

    Visual Basic Client

    Dim MatLab As Object
    Dim Result As String
    Dim MReal(4,4) As Double
    Dim MImage(4,4) As Double

    MatLab = CreateObject("matlab.application")
    Result = MatLab.Execute("A = rand(5);")
    MatLab.GetFullMatrix("A","base",MReal,MImage)

    }

    // Функция VarArrayRef возвращает ссылку на массив значений типа Variant
    V.GetFullMatrix('A','base',VarArrayRef(MReal),VarArrayRef(MImage));

    for i := 0 to 2 do
      for j := 0 to 2 do
        StringGrid1.Cells[j,i] := MReal[i,j];

    V.Quit; // Закрытие MATLAB
    V := Unassigned
  except
    // Код, исполняемый в случае генерации исключения
  end
end;
