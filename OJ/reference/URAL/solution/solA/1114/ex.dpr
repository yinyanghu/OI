{
�����Ŀ��һ�������ѧ���⣬�������ܶࡣ�ҵķ����������ġ�
���ȣ����ѷ���������ɫ���򣬷�������У��ǻ�����ɵġ������ܷ�����Ӧ����������ɫ
�������n��������ķ������Ļ�������n�����ӣ�δ�ط�ȫa����������ͬ�ģ����Ӳ���ͬ
�����ظ������������������������Ϊδ�ط�ȫa�������Կ��԰�δ����n�����������
��Ϊ�����˵�n+1�����ӡ����������ظ����У������ܷ�������C(n+1+a-1,a)=C(n+a,a)
��������Ŀ�Ľ��Ӧ����C(n+a,a)*C(n+b,b)
}
program Ural_1114(Input, output);
const
    MaxLen = 100;
type
    TIndex = Longint;
    TData = record
        D: array[1..MaxLen] of Longint;
        Len: TIndex;
    end;
var
    N, A, B: TIndex;
    X: TData;

procedure Multiplication(Multiplier: TIndex);
var
    i: TIndex;
begin
    for i := 1 to X.Len do
        X.D[i] := X.D[i] * Multiplier;
    for i := 1 to X.Len do
    begin
        Inc(X.D[i + 1], X.D[i] div 10);
        X.D[i] := X.D[i] mod 10;
    end;
    while X.D[X.Len + 1] > 0 do
    begin
        Inc(X.Len);
        Inc(X.D[X.Len + 1], X.D[X.Len] div 10);
        X.D[X.Len] := X.D[X.Len] mod 10;
    end;
end;

procedure Division(Divisor: TIndex);
var
    i, Residue: TIndex;
begin
    Residue := 0;
    for i := X.Len downto 1 do
    begin
        Residue := Residue * 10 + X.D[i];
        X.D[i] := Residue div Divisor;
        Residue := Residue mod Divisor;
    end;
    while X.D[X.Len] = 0 do
        Dec(X.Len);
end;

procedure Main;
var
    i: TIndex;
begin
    Readln(N, A, B);
    FillChar(X, SizeOf(X), 0);
    X.D[1] := 1;
    X.Len := 1;
    for i := 1 to A do
        Multiplication(N + A - i + 1);
    for i := 1 to A do
        Division(i);
    for i := 1 to B do
        Multiplication(N + B - i + 1);
    for i := 1 to B do
        Division(i);
    for i := X.Len downto 1 do
        Write(X.D[i]);
    Writeln;
end;
begin
    Main;
end. 
