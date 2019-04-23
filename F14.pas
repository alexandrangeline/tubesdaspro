unit F14;
interface
	uses typelist, F13;
	procedure SaveBuku (lBuku: List_Buku; s: string);
	procedure SaveUser (lUser: List_User; s: string);
	procedure SavePeminjaman (lPeminjaman: List_Peminjaman; s: string);
	procedure SavePengembalian (lPengembalian: List_Pengembalian; s: string);
	procedure SaveBuku_Hilang (lBuku_Hilang: List_Buku_Hilang; s: string);
	procedure Save(lBuku: List_Buku; lUser: List_User; lPeminjaman: List_Peminjaman; lPengembalian: List_Pengembalian; lBuku_Hilang: List_Buku_Hilang; var	filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);	
	procedure SaveExit(var lBuku: List_Buku;var lUser: List_User;var lPeminjaman: List_Peminjaman;var lPengembalian: List_Pengembalian;var lBuku_Hilang: List_Buku_Hilang; var	filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);	

	
implementation
	procedure SaveBuku (lBuku: List_Buku; s: string);
	var
		UserFile : textfile;
		i: integer;
		draft,Arr_Judul_Buku , Arr_Author, Arr_Kategori, Str_ID_Buku, Str_Jumlah_Buku, Str_Tahun_Penerbit: array [1..1000] of string;
		Arr_ID_Buku, Arr_Jumlah_Buku, Arr_Tahun_Penerbit : array [1..1000] of integer;
	begin
		Assign(Userfile, s);
		Rewrite(Userfile);
		for i:=1 to lBuku.Neff do begin
			Arr_ID_Buku[i]:= lBuku.listbuku[i].ID_Buku;
			Arr_Judul_Buku[i]:= lBuku.listbuku[i].Judul_Buku;
			Arr_Author[i]:= lBuku.listbuku[i].Author;
			Arr_Jumlah_Buku[i]:= lBuku.listbuku[i].Jumlah_Buku;
			Arr_Tahun_Penerbit[i]:= lBuku.listbuku[i].Tahun_Penerbit;
			Arr_Kategori[i]:= lBuku.listbuku[i].Kategori;
			str(Arr_ID_Buku[i], Str_ID_Buku[i]);
			str(Arr_Jumlah_Buku[i], Str_Jumlah_Buku[i]);
			str(Arr_Tahun_Penerbit[i], Str_Tahun_Penerbit[i]);
			draft[i]:= Str_ID_Buku[i] +','+ Arr_Judul_Buku[i]+',' + Arr_Author[i]+',' +Str_Jumlah_Buku[i] +',' + Str_Tahun_Penerbit[i] +',' + Arr_Kategori[i]+',';
			writeln(Userfile, draft[i]);
		end;
		close(UserFile);
	end;
	
	procedure SaveUser (lUser: List_User; s: string);
	var
		UserFile : textfile;
		i: integer;
		draft, Arr_Nama, Arr_Alamat, Arr_Username, Arr_Password, Arr_Role: array [1..1000] of string;
	begin
		Assign(Userfile, s);
		Rewrite(Userfile);
		for i:=1 to lUser.Neff do begin
			Arr_Nama[i]:= lUser.listUser[i].Nama;
			Arr_Alamat[i]:= lUser.listUser[i].Alamat;	
			Arr_Username[i]:= lUser.listUser[i].Username;
			Arr_Password[i]:= lUser.listUser[i].Password;
			Arr_Role[i]:= lUser.listUser[i].Role;
			draft[i]:= Arr_Nama[i]+','+ Arr_Alamat[i]+','+ Arr_Username[i]+','+ Arr_Password[i]+','+ Arr_Role[i]+',';
			writeln(Userfile, draft[i]);
		end;
		close(UserFile);
	end;
	
	procedure SavePeminjaman (lPeminjaman: List_Peminjaman; s: string);
	var
		UserFile : textfile;
		i: integer;
		draft, Arr_Username, Arr_Status_Pengembalian, Str_ID_Buku: array [1..1000] of string;
		Arr_Tanggal_Peminjaman, Arr_Tanggal_Batas_Pengembalian: array [1..1000] of tanggal;
		Arr_ID_Buku: array [1..1000] of integer;
	begin
		Assign(Userfile, s);
		Rewrite(Userfile);
		for i:=1 to lPeminjaman.Neff do begin
			Arr_Username[i]:= lPeminjaman.listPeminjaman[i].Username;
			Arr_ID_Buku[i]:= lPeminjaman.listPeminjaman[i].ID_Buku;
			Arr_Tanggal_Peminjaman[i]:= lPeminjaman.listPeminjaman[i].Tanggal_Peminjaman;
			Arr_Tanggal_Batas_Pengembalian[i]:= lPeminjaman.listPeminjaman[i].Tanggal_Batas_Pengembalian;
			Arr_Status_Pengembalian[i]:= lPeminjaman.listPeminjaman[i].Status_Pengembalian;
			str(Arr_ID_Buku[i], Str_ID_Buku[i]);
			draft[i]:= Arr_Username[i]+','+ Str_ID_Buku[i]+','+ TanggalToString(Arr_Tanggal_Peminjaman[i])+','+ TanggalToString(Arr_Tanggal_Batas_Pengembalian[i])+','+Arr_Status_Pengembalian[i]+',';
			writeln(Userfile, draft[i]);
		end;
		close(UserFile);
	end;
	
	procedure SavePengembalian (lPengembalian: List_Pengembalian; s: string);
	var
		UserFile : textfile;
		i: integer;
		draft, Arr_Username, Str_ID_Buku: array [1..1000] of string;
		Arr_Tanggal_Pengembalian: array [1..1000] of tanggal;
		Arr_ID_Buku: array [1..1000] of integer;
	begin
		Assign(Userfile, s);
		Rewrite(Userfile);
		for i:=1 to lPengembalian.Neff do begin
			Arr_Username[i]:= lPengembalian.listPengembalian[i].Username;
			Arr_ID_Buku[i]:= lPengembalian.listPengembalian[i].ID_Buku;
			Arr_Tanggal_Pengembalian[i]:= lPengembalian.listPengembalian[i].Tanggal_Pengembalian;
			str(Arr_ID_Buku[i], Str_ID_Buku[i]);
			draft[i]:= Arr_Username[i]+','+ Str_ID_Buku[i]+','+ TanggalToString(Arr_Tanggal_Pengembalian[i])+',';
			writeln(Userfile, draft[i]);
		end;
		close(UserFile);
	end;
	
	
	procedure SaveBuku_Hilang (lBuku_Hilang: List_Buku_Hilang; s: string);
		var
		UserFile : textfile;
		i: integer;
		draft, Arr_Username, Str_ID_Buku_Hilang: array [1..1000] of string;
		Arr_Tanggal_Laporan: array [1..1000] of tanggal;
		Arr_ID_Buku_Hilang: array [1..1000] of integer;
	begin
		Assign(Userfile, s);
		Rewrite(Userfile);
		for i:=1 to lBuku_Hilang.Neff do begin
			Arr_Username[i]:= lBuku_Hilang.listBuku_Hilang[i].Username;
			Arr_ID_Buku_Hilang[i]:= lBuku_Hilang.listBuku_Hilang[i].ID_Buku_Hilang;
			Arr_Tanggal_Laporan[i]:= lBuku_Hilang.listBuku_Hilang[i].Tanggal_Laporan;
			str(Arr_ID_Buku_Hilang[i], Str_ID_Buku_Hilang[i]);
			draft[i]:= Arr_Username[i]+','+ Str_ID_Buku_Hilang[i]+','+ TanggalToString(Arr_Tanggal_Laporan[i])+',';
			writeln(Userfile, draft[i]);
		end;
		close(UserFile);
	end;
	procedure Save(lBuku: List_Buku; lUser: List_User; lPeminjaman: List_Peminjaman; lPengembalian: List_Pengembalian; lBuku_Hilang: List_Buku_Hilang; var	filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);	
	begin
		write('Masukkan nama File Buku: ');
		readln(filebuku);
		SaveBuku(lBuku, filebuku);
		write('Masukkan nama File User: ');
		readln(fileuser);
		SaveUser(lUser, fileuser);
		write('Masukkan nama File Peminjaman: ');
		readln(filepeminjaman);
		SavePeminjaman(lPeminjaman, filepeminjaman);
		write('Masukkan nama File Pengembalian: ');
		readln(filepengembalian);
		SavePengembalian(lPengembalian, filepengembalian);
		write('Masukkan nama File Buku Hilang: ');
		readln(filehilang);
		SaveBuku_Hilang(lBuku_Hilang, filehilang);
		writeln();
		writeln('Data berhasil disimpan!');
	end;	
	procedure SaveExit(var lBuku: List_Buku;var lUser: List_User;var lPeminjaman: List_Peminjaman;var lPengembalian: List_Pengembalian;var lBuku_Hilang: List_Buku_Hilang; var	filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);	
	begin
		SaveBuku(lBuku, filebuku);
		SaveUser(lUser, fileuser);
		SavePeminjaman(lPeminjaman, filepeminjaman);
		SavePengembalian(lPengembalian, filepengembalian);
		SaveBuku_Hilang(lBuku_Hilang, filehilang);
	end;	
end.
