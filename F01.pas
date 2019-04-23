unit F01;
{Unit untuk mendaftarkan akun oleh admin}
interface
uses typelist,F13;
{Kamus}
var
	luser : List_User;
	procedure registrasiuser (var luser : List_User);
	{Prosedur yang menerima input nama,alamat,username,dan password dari user kemudian menyimpannya pada array of records yang telah diset pada unit typelist }
implementation
	procedure registrasiuser (var luser : List_User);
	{Prosedur yang menerima input nama,alamat,username,dan password dari user kemudian menyimpannya pada array of records yang telah diset pada unit typelist }
	{Kamus lokal}
	var
		inama, ialamat, iusername, ipassword : string ; 
		terisi : boolean;
		i : integer;
	begin
		// input dari user
		write('Masukan nama pengunjung: ');
		readln(inama);
		write('Masukan alamat pengunjung: ');
		readln(ialamat);
		write('Masukan username pengunjung: ');
		readln(iusername);
		write('Masukan password pengunjung: ');
		readln(ipassword);
	// inisialisasi
	terisi := false; 
	i := 1;
	while (i <= 100) and (terisi=false) do 
	begin
		// jika elemen array ke-i kosong maka input dari user diisikan elemen array tersebut
		if (luser.listuser[i].Nama = '') then
		begin 
			luser.listuser[i].Nama := inama; 
			luser.listuser[i].Alamat := ialamat; 
			luser.listuser[i].Username := iusername;
			luser.listuser[i].Password := ipassword;
			luser.listuser[i].Role := 'pengunjung';
			terisi := true ;
		end else // jika elemen ke-i tidak kosong maka inputan dari user tidak akan disimpan pada elemen ke-i melainkan akan terus dicari elemen ke-i yang kosong sampai sampai index terakhir 
		begin
			// increment 
			i := i + 1 ; // increment 
		end;
	end;
	// analisis kasus
	if (luser.Neff <> 100) then 
	begin
		// Penambahan Neff ketika terjadi penambahan akun
		luser.Neff := luser.Neff + 1 ;
	end ;
	// analisis kasus
	if (terisi=true) then
	begin 
		// output ke layar jika user berhasil didaftarkan
		write('Pengunjung ',inama,' telah berhasil terdaftar sebagai user.');
	end else 
	begin
		// output ke layar jika user tidak berhasil didaftarkan
		write('Pengunjung ',inama,' tidak berhasil terdaftar sebagai user.');
	end;
	end;		
end.
