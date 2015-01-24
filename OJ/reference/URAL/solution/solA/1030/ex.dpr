{
point (latitude,longitude)
we redefine:
 latitude in [-90,90], NL in [0,90] , SL in [-90,0]
 longitude in [0,360)  EL in [0,180), WL in [180,360)

Create 3D Coordinate
O(0,0,0) is the centre of the sphere.
z=0 is the plane parallel to latitude.
[pic]
turn point (latitude,longitude) to 3D Coordinate:
z=r*sin(lat)
r'=sqrt(r^2-z^2),   radii in the z=r*sin(lat) plane
x=r'*cos lon
y=r'*sin lon
point (x,y) in circle with radii r' in the z=r*sin(lat) plane

the plane within(0,A,B) in sphere:
   O
r /a\  r
 /   \
A----B
   d
2*r*r*cos a=2*r^2-d^2 
arc AB = a*r (namely real distance on sphere)

output:
    Direct Print (99.999->99.99) + If D<100     // Wa at 6
    Round(2) Print (99.999->100.00) + If D<100     // Wa at 7
    Round(2) Print (99.999->100.00) + If Round(2) D <100 (namely Keep same ) // AC
}
program Ural_1030(Input, Output);
const
    R = 6875 / 2;
type
    TData = Extended;
    TPointAngle = record
        Lat, Lon: TData;
    end;
    TPointCoordinate = record
        X, Y, Z: TData;
    end;

procedure GetValue(Source: string; var Value: TData; var Ch: Char);
var
    tmp: Longint;
    Code: Integer;
begin
    Val(Copy(Source, 1, Pos('^', Source) - 1), tmp, Code);
    Value := tmp;
    Delete(Source, 1, Pos('^', Source));
    Val(Copy(Source, 1, Pos('''', Source) - 1), tmp, Code);
    Value := Value + tmp / 60;
    Delete(Source, 1, Pos('''', Source));
    Val(Copy(Source, 1, Pos('"', Source) - 1), tmp, Code);
    Value := Value + tmp / 3600;
    Delete(Source, 1, Pos('"', Source));
    Delete(Source, 1, 1); //Space
    Ch := Source[1];
end;

procedure Init(var Aa, Ba: TPointAngle);
var
    St, Buffer: string;
    Ch: Char;
begin
    Readln(Buffer);
    Readln(Buffer);
    Readln(Buffer);

    Readln(St);
    GetValue(St, Aa.Lat, Ch);
    if Ch = 'S' then Aa.Lat := -Aa.Lat;
    Readln(St);
    Delete(St, 1, 4); //Delete "and "
    GetValue(St, Aa.Lon, Ch);
    if Ch = 'W' then Aa.Lon := 360 - Aa.Lon;

    Readln(Buffer);

    Readln(St);
    GetValue(St, Ba.Lat, Ch);
    if Ch = 'S' then Ba.Lat := -Ba.Lat;
    Readln(St);
    Delete(St, 1, 4); //Delete "and "
    GetValue(St, Ba.Lon, Ch);
    if Ch = 'W' then Ba.Lon := 360 - Ba.Lon;

    Readln(Buffer);
end;

function ToArc(X: TData): TData;
begin
    ToArc := X * Pi / 180;
end;

procedure AngleToCoordinate(Xa: TPointAngle; var Xp: TPointCoordinate);
var
    Rt: TData;
begin
    Xp.Z := R * Sin(ToArc(Xa.Lat));
    Rt := Sqrt(Sqr(R) - Sqr(Xp.Z));
    Xp.X := Rt * Cos(ToArc(Xa.Lon));
    Xp.Y := Rt * Sin(ToArc(Xa.Lon));
end;

function GetDistance(Ap, Bp: TPointCoordinate): TData;
begin
    GetDistance := Sqrt(Sqr(Ap.X - Bp.X) + Sqr(Ap.Y - Bp.Y) + Sqr(Ap.Z - Bp.Z));
end;

function ArcCos(X: TData): TData;
begin
    if X = 0 then
        ArcCos := Pi / 2
    else if X < 0 then
        ArcCos := ArcTan(Sqrt(1 - Sqr(X)) / X) + Pi
    else
        ArcCos := ArcTan(Sqrt(1 - Sqr(X)) / X);
end;


function IsDangerous(X: TData): Boolean;
var
    St: string;
    T: Longint;
    Code: Integer;
begin
    Str(X: 0: 2, St);
    Delete(St, Pos('.', St), 1);
    Val(St, T, Code);
    IsDangerous := (T < 10000);
end;

procedure Main;
var
    Aa, Ba: TPointAngle;
    Ap, Bp: TPointCoordinate;
    D: TData;
begin
    Init(Aa, Ba);
    AngleToCoordinate(Aa, Ap);
    AngleToCoordinate(Ba, Bp);
    D := R * ArcCos(1 - Sqr(GetDistance(Ap, Bp)) / (2 * Sqr(R)));
    Writeln('The distance to the iceberg: ', D: 0: 2, ' miles.');
    if IsDangerous(D) then Writeln('DANGER!');
end;
begin
    {   Assign(Input, 'i.txt');
       Reset(Input);
       Assign(Output, 'o.txt');
       Rewrite(Output);    }
    Main;
    {  Close(Input);
      Close(Output);}
end.

