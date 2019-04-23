unit F02;
{Unit untuk login}
interface
uses typelist,F13;

procedure masuk (luser : List_user; var loginuname, loginrole: string);
{Prosedur yang menerima input dari user berupa username dan password dan mengubah status login ketika username
dan password yang diinput user sesuai dengan yang terdaftar}
implementation
procedure masuk (luser : List_user; var loginuname, loginrole:string);
{Prosedur yang menerima input dari user berupa username dan password dan mengubah status login ketika username
dan password yang diinput user sesuai dengan yang terdaftar}
{Kamus lokal}
var
	login : boolean ;
	uname : string ;
	pword : string ;
	i : integer ;
begin
	repeat
	// input dari user
	write('Masukkan username: ');
	readln(uname);
	write('Masukkan password: ');
	readln(pword);
	// inisialisasi
	login := false;
	i := 1 ;
	while (i <= luser.Neff) and (login = false) do
	begin
		// analisis kasus
		if((luser.listuser[i].username) = uname) and ((luser.listuser[i].password) = pword) then 
		begin
			// aksi ketika username dan password yang dimasukan oleh user cocok}
			login := true ;
			loginuname := luser.listuser[i].username ;
			loginrole := luser.listuser[i].Role ;
		end;
		// increment i
		i := i + 1 ;
	end;
	// analsis kasus
	if (login = false) then
	begin 	
		// keluaran apabila user tidak berhasil login
		writeln('Username / Password salah! Silahkan coba lagi.');
	end;
	until (login = true);
	// keluaran apabila user berhasil login
	writeln('Selamat datang ',luser.listuser[i-1].nama,' !');
end;
end.
			
