(*
This is Data Structure + Maths
Notice, each of vector doesn't exceed L --[*]
Below we assume the worst status that the lengths of all vector are L.
we can use thought of recursion because of [*] and two vector can be added.
namely we ceaselessly decrease the number of vector after some operation
and always keep rule [*] after one operation.
[1]
(1)when angle BAD>=90
    B            Vector AB + Vector CA = Vector CB
    \            |CB|^2=|AB|^2+|CA|^2-2|AB||CA|Cos(pi-angle BAD)
  ___\____       |AB|=|CA|=L ,    |CB|<=L --[*]
 C   A    D     =>     |CB|^2=2*L^2*(1-Cos(pi-angle BAD))<=L^2
                =>  Cos(pi-angle BAD)>=1/2 =>angle BAD>=120
(2)when angle BAD<=90
       B         Let Vector AB'=- Vector AB
      /          Vector AB' + Vector CA = Vector CB'
C___A/____D      Because of (1)   => angle BAD<=60
    /
   /
   B'
[2]
when two vectors has |cos angel|>=0.5 (namely angel<=60 angel >=120)
then two vectors be merge to one vector (add) and keep [*]
---operation [**]
prove it must have two vectors in random three vectors can use operation [**]
we create two drawers that one is doing [**] (0<=angel<=60 and 120<=angel<=180),
the other is non-doing [**] (60<angel<120)
and no the third status  (0<=angel<=180)
so must has two vectors can do [**]
thus random select three vectors do [**] until it remain only two vectors.
if last two vectors has angle>=90 then directly add
else one of them reverse to add

Data Structure
Notice : Time Limit: 0.1 second
if we reverse one vector A
then we have to update direction of vectors ,the sum of which is A.
We must find out a good data structure.
a little change DS-Disjoint Sets
define: Vector A,Vector B can do [**] ,and B always reverse if need
(0)if B reverse then B must flag [1] to express itself reverses
(1)B(maybe reverse) always is A 's Children
(2)if B reverse then root of B must flag [2] to express all its children reverse
(3)if B is merged then B and its children structures mustn't change again.
in the end print X for all node
M is the number of all ancestors of X which be flaged[2] + Ord(if itself is flaged [1])
if Odd(M) then then X is reversed
else X is positive
*)
program Ural_1130(Input, Output);
const
    MaxN = 10000;
type
    TIndex = Longint;
    TData = Real;
    TNode = record
        Pre, Flag: Boolean; //false 1,true -1
        Father: TIndex;
    end;
    TTree = array[1..MaxN] of TNode;
    TVector = record
        X, Y: TIndex;
    end;
    TSet = record
        Root: TIndex;
        Value: TVector;
    end;
var
    T: TTree;
    A, B: TSet;
    N: TIndex;
    L: TIndex;

function FindFlag(X: TIndex): Boolean;
begin
    if T[X].Father = 0 then
        FindFlag := T[X].Pre
    else
        FindFlag := T[X].Pre xor FindFlag(T[X].Father);
end;

procedure Union(Father, Children: TIndex);
begin
    T[Children].Father := Father;
end;

function GetCos(A, B: TVector): TData;
var
    mA, mB: TData;
begin
    GetCos := -1; //Cos 180
    mA := Sqrt(Sqr(A.X) + Sqr(A.Y));
    mB := Sqrt(Sqr(B.X) + Sqr(B.Y));
    if (mA = 0) or (mB = 0) then Exit;
    GetCos := (A.X * B.X + A.Y * B.Y) / mA / mB;
end;

procedure Main;
label
    Print;
var
    i: TIndex;
    Cur: TVector;
begin
    Readln(N);
    Readln(L);
    Readln(A.Value.X, A.Value.Y);
    A.Root := 1;
    T[1].Flag := false;
    T[1].Pre := false;
    T[1].Father := 0;
    if N = 1 then goto Print;
    Readln(B.Value.X, B.Value.Y);
    B.Root := 2;
    T[2].Flag := false;
    T[2].Pre := false;
    T[2].Father := 0;
    for i := 3 to N do
    begin
        Readln(Cur.X, Cur.Y);
        T[i].Flag := false;
        T[i].Pre := false;
        if Abs(GetCos(A.Value, Cur)) >= 0.5 then
        begin
            if GetCos(A.Value, Cur) >= -0.5 then
            begin
                T[i].Flag := true;
                Cur.X := -Cur.X;
                Cur.Y := -Cur.Y;
            end;
            Union(A.Root, i);
            Inc(A.Value.X, Cur.X);
            Inc(A.Value.Y, Cur.Y);
        end
        else if Abs(GetCos(B.Value, Cur)) >= 0.5 then
        begin
            if GetCos(B.Value, Cur) >= -0.5 then
            begin
                T[i].Flag := true;
                Cur.X := -Cur.X;
                Cur.Y := -Cur.Y;
            end;
            Union(B.Root, i);
            Inc(B.Value.X, Cur.X);
            Inc(B.Value.Y, Cur.Y);
        end
        else if Abs(GetCos(A.Value, B.Value)) >= 0.5 then
        begin
            if GetCos(A.Value, B.Value) >= -0.5 then
            begin
                T[B.Root].Pre := true;
                B.Value.X := -B.Value.X;
                B.Value.Y := -B.Value.Y;
            end;
            Union(A.Root, B.Root);
            Inc(A.Value.X, B.Value.X);
            Inc(A.Value.Y, B.Value.Y);
            B.Root := i;
            B.Value := Cur;
            T[i].Father := 0;
        end;
    end;
    if GetCos(A.Value, B.Value) >= 0 then //<=90
    begin
        T[B.Root].Pre := true;
        B.Value.X := -B.Value.X;
        B.Value.Y := -B.Value.Y;
    end;
    Union(A.Root, B.Root);
    Inc(A.Value.X, B.Value.X);
    Inc(A.Value.Y, B.Value.Y);
    Print:
    if Sqr(A.Value.X) + Sqr(A.Value.Y) <= Sqr(L) then
    begin
        Writeln('YES');
        for i := 1 to N do
            if T[i].Flag xor FindFlag(i) then
                Write('-')
            else
                Write('+');
        Writeln;
    end
    else
        Writeln('WRONG ANSWER');
end;
begin
    { Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);   }
    Main;
    { Close(Input);
     Close(Output); }
end.

