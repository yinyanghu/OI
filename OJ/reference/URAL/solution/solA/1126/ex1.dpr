(*
Heap
First thought:
1.Keep exact |M| in heap for every check 
2.and output Max in heap for every check 
but because in step 1, item that is deleted  may be not Max
that is wrong for heap operation
Second thought:
1.push New Value for every check 
2.output Max that index of Max is in [i-M+1,i] in heap
in step 2, if Max is not in  [i-M+1,i] (namely index of Max<=i,this Max is disable) then delete it until find Max in [i-M+1,i]

*)
program Ural_1126(Input, Output);
//0.046 569 kb
const
    MaxN = 25000;
    Buffer = 2;
type
    TIndex = Longint;
    TData = Longint;
    TNode = record
        Ind: TIndex;
        Value: TData;
    end;
    TQueue = array[1..MaxN + Buffer] of TNode;
var
    N, M, Len: TIndex;
    Q: TQueue;

procedure InsertNode(tmp: TNode);
var
    i: TIndex;
begin
    Inc(Len);
    i := Len;
    while i > 1 do
        if tmp.Value > Q[i div 2].Value then
        begin
            Q[i] := Q[i div 2];
            i := i div 2;
        end
        else
            Break;
    Q[i] := tmp;
end;

procedure DeleteMax;
var
    i, j: TIndex;
    tmp: TNode;
begin
    tmp := Q[Len];
    Dec(Len);
    i := 1;
    while i * 2 <= Len do
    begin
        j := i * 2;
        if (j + 1 <= Len) and (Q[j].Value < Q[j + 1].Value) then Inc(j);
        if tmp.Value < Q[j].Value then
        begin
            Q[i] := Q[j];
            i := j;
        end
        else
            Break;
    end;
    Q[i] := tmp;
end;

function Maximum: TNode;
begin
Maximum := Q[1];
end;     

procedure Main;
var
    T: TData;
    NewN: TNode;
begin
    FillChar(Q, SizeOf(Q), 0);
    Readln(M);
    Len := 0;
    N := 0;
    repeat
        Readln(T);
        if T = -1 then Break;
        Inc(N);
        NewN.Ind := N;
        NewN.Value := T;
        InsertNode(NewN);
        if N >= M then
        begin
            while Maximum.Ind < N - M + 1 do
                DeleteMax;
            Writeln(Maximum.Value);
        end;
    until false;
end;
begin
    {     Assign(Input, 'i.txt');
          Reset(Input);
          Assign(Output, 'o.txt');
          Rewrite(Output);   }
    Main;
    { Close(Input);
      Close(Output);}
end.

