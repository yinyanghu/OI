(*

(1)We'll say that two sets are "similar" if one of them is obtained by deleting one good form the second set or by replacing one good to another.
Notice: 1 2 3 is not similar to 1 2 3 (hasn't deleted or replacing)
(2)Every two sets sent to the shop should not be similar.
In other words, two similar sets should not be sent to the same shop.
// I am baffled by it for long ,he he
(3)Let set S1,S2 are similar that S1={x1,x2,..,xk,p} , S2={x1,x2,..,xk,q}  because of rule (1) p<>q
when deleting status , p (xor q) = 0 (only p or only q)
Let
s1=x1+x2+...+xk+p
s2=x1+x2+...+xk+q
Get 0<x1,x2,..,xk<=n,0<=p,q<=n,p<>q => 0<|s1-s2|<=n -*
Then create form 0 to n , n+1 drawers
r1=s1 mod (n+1)
r2=s2 mod (n+1)
* => 0<|r1-r2|<=n =>r1<>r2
thus S1,S2 are similar => (Sum of S1 mod n+1) isn't equal to (Sum of S2 mod n+1)
notice this proposition isn't reversible!!!!
"(Sum of S1 mod n+1) isn't equal to (Sum of S2 mod n+1)" cannot get "S1,S2 are similar"
// I am baffled by it for long
// At first I assume that proposition can be reversible
// So I want to create Graph ,and travel... Jackass!!
Because of rule (2) ,and just now i have created n+1 drawers
if each two similar set in the whole sets are in different drawers
so only put them in their corresponding different drawers because of m>=n+1 
//brain is baffled
*)
program Ural_1107(Input, Output);
type
    TIndex = Longint;

procedure Main;
var
    N, K, M, R, S, T: TIndex;
begin
    Readln(N, K, M);
    Writeln('YES'); 
    while K > 0 do
    begin
        Dec(K);
        Read(R);
        S := 0;
        while R > 0 do
        begin
            Dec(R);
            Read(T);
            Inc(S, T);
        end;
        Readln;
        Writeln(S mod (N + 1) + 1); //M>=N+1
    end;
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
  {  Close(Input);
    Close(Output); }
end.

