unit F13;
interface
	uses typelist;
	function StrToInt(x: string):integer;
	{Mengubah bentuk string ke dalam integer}
	procedure loadBuku(namafile:string; var c:List_Buku);
	{Membaca file eksternal buku dan menuliskannya ke dalam array type bentukan List_Buku}
	procedure loadUser(namafile:string; var c:List_User);
	{Membaca file eksternal user dan menuliskannya ke dalam array type bentukan List_User}
	procedure loadTanggal(s: string; var c: tanggal);
	{Membaca string tanggal dan mengembalikannya ke dalam bentuk type bentukan tanggal}
	procedure loadPeminjaman(namafile:string; var c:List_Peminjaman);
	{Membaca file eksternal peminjaman dan menuliskannya ke dalam array type bentukan List_Peminjaman}
	procedure loadPengembalian(namafile:string;var c:List_Pengembalian);
	{Membaca file eksternal pengembalian dan menuliskannya ke dalam array type bentukan List_Pengembalian}
	procedure loadBuku_Hilang(namafile:string;var c:List_Buku_Hilang);
	{Membaca file eksternal buku hilang dan menuliskannya ke dalam array type bentukan List_Buku_Hilang}
	procedure LoadExit(var lBuku: List_Buku; lUser: List_User; lPeminjaman: List_Peminjaman; lPengembalian: List_Pengembalian; lBuku_Hilang: List_Buku_Hilang; filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);	
	{Membaca file eksternal buku, user, peminjaman, pengembalian, dan buku hilang kemudian menuliskannya ke dalam array type bentukan masing-masing}
	function TanggalToString (t: tanggal): string;

implementation
	var
		UserFile : textfile;
		readchar: char;
		rec: array [1..1000] of string;
		i, j: integer;
		
	function StrToInt(x: string):integer;
	var
		iNum: Integer;
		code: Integer;
	begin
		Val(x, iNum, code); 
		StrToInt:=iNum;
	end;
	
	procedure loadBuku(namafile:string; var c: List_Buku);
	var
		Buku1 : List_Buku;
		
	begin
		Assign(UserFile, namafile);
		reset(UserFile);		
		read(UserFile, readchar);
		i:= 0;
		j:= 1;
		while not eof(UserFile) do begin
			inc(i);
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku1.listbuku[i].ID_Buku:=StrToInt(rec[i]);
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku1.listbuku[i].Judul_Buku:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku1.listbuku[i].Author:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku1.listbuku[i].Jumlah_Buku:=StrToInt(rec[i]);
			inc(j);
			rec[i]:='';
			while (readchar <> ',')do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku1.listbuku[i].Tahun_Penerbit:=StrToInt(rec[i]);
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku1.listbuku[i].Kategori:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> LineSep) do begin
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			inc(j);
		end;
		Buku1.Neff:= i;
		c:= Buku1;
		close(UserFile);
	end;
	
	procedure loadUser(namafile:string; var c: List_User);
	var
		User1 : List_User;
		
	begin
		Assign(UserFile, namafile);
		reset(UserFile);		
		read(UserFile, readchar);
		i:= 0;
		j:= 1;
		while not eof(UserFile) do begin
			inc(i);
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			User1.listuser[i].Nama:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			User1.listuser[i].Alamat:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			User1.listuser[i].Username:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			User1.listuser[i].Password:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			User1.listuser[i].Role:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> LineSep) do begin
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			inc(j);
		end;
		User1.Neff:= i;
		c:= User1;
		close(UserFile);
	end;
	
	procedure loadTanggal (s: string; var c: tanggal);
	var
		recs: string;
		j: integer;
	begin
		recs:= '';
		j:=1;
		while (s[j] <> '/') and (j<=2) do begin
			recs:= recs + s[j];			
			inc(j);
		end;
		c.hari:= StrToInt(recs);
		inc(j);
		recs:='';
		while (s[j]<> '/') and (j<=5) do begin
			recs:= recs + s[j];			
			inc(j);
		end;
		c.bulan:= StrToInt(recs);
		inc(j);
		recs:='';
		while (j<=10) do begin
			recs:= recs + s[j];			
			inc(j);
		end;
		c.tahun:= StrToInt(recs);
	end;
	
	procedure loadPeminjaman(namafile:string; var c:List_Peminjaman);
	var
		Peminjaman1 : List_Peminjaman;
		tanggalpeminjaman, tanggalbataspengembalian: tanggal;
	begin
		Assign(UserFile, namafile);
		reset(UserFile);		
		read(UserFile, readchar);
		i:= 0;
		j:= 1;
		while not eof(UserFile) do begin
			inc(i);
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Peminjaman1.listPeminjaman[i].Username:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Peminjaman1.listPeminjaman[i].ID_Buku:=StrToInt(rec[i]);
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			loadTanggal(rec[i], tanggalpeminjaman);
			Peminjaman1.listPeminjaman[i].Tanggal_Peminjaman:= tanggalpeminjaman;
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			loadTanggal(rec[i], tanggalbataspengembalian);
			Peminjaman1.listPeminjaman[i].Tanggal_Batas_Pengembalian:= tanggalbataspengembalian;
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Peminjaman1.listPeminjaman[i].Status_Pengembalian:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> LineSep) do begin
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			inc(j);
		end;
		Peminjaman1.Neff:= i;
		c:= Peminjaman1;
		close(UserFile);
	end;
	
	
	procedure loadPengembalian(namafile:string; var c:List_Pengembalian);
	var
		Pengembalian1 : List_Pengembalian;
		tanggalpengembalian: tanggal;
	begin
		Assign(UserFile, namafile);
		reset(UserFile);		
		read(UserFile, readchar);
		i:= 0;
		j:= 1;
		while not eof(UserFile) do begin
			inc(i);
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Pengembalian1.listPengembalian[i].Username:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Pengembalian1.listPengembalian[i].ID_Buku:=StrToInt(rec[i]);
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			loadTanggal(rec[i], tanggalpengembalian);
			Pengembalian1.listPengembalian[i].Tanggal_Pengembalian:= tanggalpengembalian;
			inc(j);
			rec[i]:='';
			while (readchar <> LineSep) do begin
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			inc(j);
		end;
		Pengembalian1.Neff:= i;
		c:= Pengembalian1;
		close(UserFile);
	end;
	
	
	procedure loadBuku_Hilang(namafile:string; var c: List_Buku_Hilang);
	var
		Buku_Hilang1 : List_Buku_Hilang;
		tanggallaporan : tanggal;
	begin

		Assign(UserFile, namafile);
		reset(UserFile);		
		read(UserFile, readchar);
		i:= 0;
		j:= 1;
		while not eof(UserFile) do begin
			inc(i);
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku_Hilang1.listBuku_Hilang[i].Username:=rec[i];
			inc(j);
			rec[i]:='';
			while (readchar <> ',') do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			Buku_Hilang1.listBuku_Hilang[i].ID_Buku_Hilang:=StrToInt(rec[i]);
			inc(j);
			rec[i]:='';
			while (readchar <> ',')  do begin
				rec[i] := rec[i] + readchar;
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			loadTanggal(rec[i], tanggallaporan);
			Buku_Hilang1.listBuku_Hilang[i].Tanggal_Laporan:= tanggallaporan;
			inc(j);
			rec[i]:='';
			while (readchar <> LineSep)  do begin
				read(UserFile, readchar);
				inc(j);
			end;
			read(UserFile, readchar);
			inc(j);
		end;
		Buku_Hilang1.Neff:= i;
		c:= Buku_Hilang1;
		close(UserFile);
	end;
		
	
	procedure LoadExit(var lBuku: List_Buku; lUser: List_User; lPeminjaman: List_Peminjaman; lPengembalian: List_Pengembalian; lBuku_Hilang: List_Buku_Hilang; filebuku, fileuser, filepeminjaman, filepengembalian, filehilang: string);	
	begin
		loadBuku(filebuku, lBuku);
		loadUser(fileuser, lUser);
		loadPeminjaman(filepeminjaman, lPeminjaman);
		loadPengembalian(filepengembalian, lPengembalian);
		loadBuku_Hilang(filehilang, lBuku_Hilang);
	end;
	
	function TanggalToString (t: tanggal): string;
	var
		rec, str_hari, str_bulan, str_tahun : string;
	
	begin
		str(t.hari, str_hari);
		str(t.bulan, str_bulan);
		str(t.tahun, str_tahun);
		rec:= '';
		if (t.hari<10) then begin
			rec:= rec + '0' + str_hari;
		end else begin
			rec:= rec+ str_hari;
		end;
		rec:= rec+'/';
		if (t.bulan<10) then begin
			rec:= rec + '0' + str_bulan;
		end else begin
			rec:= rec + str_bulan;
		end;
		rec:= rec+'/';
		if (t.tahun<10) then begin
			rec:= rec + '000' + str_tahun;
		end else if (t.tahun<100) then begin
			rec:= rec + '00' + str_tahun;
		end else if (t.tahun<1000) then begin
			rec:= rec+ '0' + str_tahun;
		end else begin
			rec:= rec + str_tahun;
		end;
		TanggalToString:= rec;
	end;
	
end.
