//17:44  18:05
{$N+}
program Ural_1093(Input, Output);
const
    g = 10;
type
    TData = Extended;
var
    Cx, Cy, Cz: TData;
    Nx, Ny, Nz: TData;
    Sx, Sy, Sz: TData;
    Vx, Vy, Vz: TData;
    R: TData;

function Check(t: TData): Boolean;
var
    Mx, My, Mz, S: TData;
begin
    Mx := Sx + Vx * t;
    My := Sy + Vy * t;
    Mz := Sz + Vz * t - g / 2 * Sqr(t);
    S := Sqrt(Sqr(Mx - Cx) + Sqr(My - Cy) + Sqr(Mz - Cz));
    Check := (S < R); // not equal
end;

procedure Main;
var
    A, B, C: TData;
    tmp, ft, rt, Delta: TData;
begin
    //plan of board : Nx(Cx-x)+Ny(Cy-y)+Nz(Cz-z)=0
    //dart : M(Sx+Vx*t, Sy+Vy*t, Sz+Vz*t-g/2*t^2)
    //solve quadratic equation about time t

    Readln(Cx, Cy, Cz, Nx, Ny, Nz, R, Sx, Sy, Sz, Vx, Vy, Vz);
    A := Nz * g / 2;
    B := -Nx * Vx - Ny * Vy - Nz * Vz;
    C := Nx * (Cx - Sx) + Ny * (Cy - Sy) + Nz * (Cz - Sz);
    if A = 0 then     //simple equation
    begin
        //because of Vx*Vy<>0
        if (Check(-C / B)) and (-C / B >= 0) then  //time t may be 0 
            Writeln('HIT')
        else
            Writeln('MISSED');
    end
    else            //quadratic equation
    begin
        Delta := Sqr(B) - 4 * A * C;
        if Delta < 0 then    //no solution
            Writeln('MISSED')
        else if Delta = 0 then   //two equal solution
        begin
            if Check((-B + Sqrt(Delta)) / 2 / A) and ((-B + Sqrt(Delta)) / 2 / A >= 0) then
                Writeln('HIT')
            else
                Writeln('MISSED');
        end
        else if Delta > 0 then   //two unequal solution
        begin
            ft := (-B - Sqrt(Delta)) / 2 / A;
            rt := (-B + Sqrt(Delta)) / 2 / A;
            if ft > rt then       // keep ft<=rt
            begin
                tmp := ft;
                ft := rt;
                rt := tmp;
            end;
            if (ft < 0) and (rt < 0) then Writeln('MISSED'); //both times are negative
            if (ft < 0) and (rt >= 0) then             //only rear time is not negative
            begin
                if Check(rt) then
                    Writeln('HIT')
                else
                    Writeln('MISSED');
            end;
            //if (ft >= 0) and (rt < 0) then        //it's impossble because of ft<rt
            if (ft >= 0) and (rt >= 0) then          //both times are not negative
            begin
                if Check(ft) then          //first through the plan of board within hit
                    Writeln('HIT')
                else
                begin                      //through the plan of board without hit
                    if Check(rt) then      //second through the plan of board within hit
                        Writeln('HIT')
                    else
                        Writeln('MISSED');
                end;
            end;
        end;
    end;
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
     { Close(Input);
       Close(Output);  }
end.

