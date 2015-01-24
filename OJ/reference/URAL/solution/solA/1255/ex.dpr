program Ural_1255(Input, Output);
{
Solution 1:
E.g 5,4   Fill K kinds of Colors like below:
12341
23412
34123
41234
12345
Find the number of continuous sequence of 1..K (Row and Column)
Solution 2:
e.g 7,4
Discuss:
Status 1.
111189A
222289A
333389A
444489A
5555***
6666***
7777***
Status 2.
1111ABC
2222ABC
3333ABC
456*ABC
4567777
4568888
4569999
   when Status 2. it's Max.
   So Find Min Area of *.
About    Status 1.
  S=(N mod K)^2
About    Status 2.
  S=(K-N mod K)^2
  when  N mod K > K div 2, i.e. K-N mod K > N mod K
  so M=(1) (N^2-(N mod K)^2) div K  , when N mod K <= K div 2
       (2) (N^2-(K-N mod K)^2) div K , when N mod K > K div 2
Notice when N<K do  Solution is 0.
}
type
    TIndex = Longint;
var
    N, K: TIndex;
begin
    Readln(N, K);
    if K <= N then
    begin
        if N mod K > K div 2 then
            Writeln((Sqr(N) - Sqr(K - N mod K)) div K)
        else
            Writeln((Sqr(N) - Sqr(N mod K)) div K);
    end
    else
        Writeln(0);
end.

