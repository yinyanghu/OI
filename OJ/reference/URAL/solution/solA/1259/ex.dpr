{
������֪: ͼ��Ϊ����.���������Բ����N������ƽ��Բ��
�����������ּ�����ͬ��N���Σ������ıߵĳ��ȵĲ�ͬ
���ɶ������ӳɣ����Աߵĳ���������������Ķ������Ĳ�ͬ����ͬ��
����ת�ɴ�һ��������������������Բ������N���Ҳ��������ĵ��ظ�.
�����ĵ�Ϊq, ��һ����1<=q<=n div 2 �����ظ���
��q���� i*k mod n (0<=k<=n-1) ��ֵ���ظ���
��ȻֻҪ k������n �ͳ��� 
}
program Ural_1259(Input, Output);
const
    MaxN = 100000;
type
    TIndex = Longint;
    TFilter = array[1..MaxN] of Boolean;
var
    F: TFilter;
    N, M: TIndex;
    T, i, j: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    T := N;
    for i := 2 to N div 2 do
        if T mod i = 0 then
        begin
            while T mod i = 0 do
                T := T div i;
            for j := 1 to N div i do
                F[i * j] := true;
        end;
    M := 0;
    for i := 1 to N div 2 do
        Inc(M, Ord(not F[i]));
    Writeln(M);
end.

