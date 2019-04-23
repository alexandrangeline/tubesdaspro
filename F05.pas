unit F05; // menu peminjaman buku

interface
    uses typelist, F13;
    procedure peminjamanbuku(var daftarpeminjaman : List_Peminjaman; var daftarbuku: List_Buku; username: string);
    function isKabisat (t: integer): boolean;
    function isFebruari (b: integer): boolean;
    function isDesember (b: integer): boolean;
    function isHari30 (b: integer) : boolean;
    

implementation
    var
        convert : string;
        found : boolean; // untuk kondisi true maka peminjaman bisa dilakukan dan sebaliknya
        i, count, i_id_buku, hari, bulan, tahun : integer;
        tanggalpinjam : String;
        tanggal_pinjam : tanggal;
        tanggalbataspeminjaman : String;
        tanggal_batas_peminjaman : tanggal;
    
    function isKabisat (t: integer): boolean;
    {I.S t terdefinisi}
	{F.S Menghasilkan boolean berdasarkan input dari t yang sudah terdefinisi}
	begin
		if ((T mod 4 = 0) and (T mod 100 <> 0)) or (T mod 400 = 0) then
			isKabisat := true
		else
			isKabisat := false;
	end;
	
	function isFebruari (b: integer): boolean;
	{I.S b terdefinisi}
	{F.S Menghasilkan boolean berdasarkan input dari b yang sudah terdefinisi}
	begin
		if (b=2)then
			isFebruari := true
		else
			isFebruari := false
	end;
	
	function isDesember (b: integer): boolean;
	{I.S b terdefinisi}
	{F.S Menghasilkan boolean berdasarkan input dari b yang sudah terdefinisi}
	begin
		if (b=12)then
			isDesember := true
		else
			isDesember := false
	end;
	
	function isHari30 (b: integer) : boolean;
	{I.S b terdefinisi}
	{F.S Menghasilkan boolean berdasarkan input dari b yang sudah terdefinisi}
	begin
		if (b=4) or (b=6) or (b=9) or (b=11) then
			isHari30 := true
		else
			isHari30 := false
	end;
	
    
    procedure peminjamanbuku(var daftarpeminjaman : List_Peminjaman; var daftarbuku: List_Buku; username: string);
    {I.S daftarpeminjaman, daftarbuku, dan username terdefinisi}
	{F.S Melakukan prosedur peminjaman buku}
    begin
        { lakukan input }
        write('Masukkan id buku yang ingin dipinjam: ');
        readln(i_id_buku);
        write('Masukkan tanggal hari ini: ');
        read(tanggalpinjam);
        loadTanggal(tanggalpinjam, tanggal_pinjam); // input tanggal akses tanggalpinjam.hari
        

        { cek buku yang ada di listbuku }
        i := 1;
        found := false;
        count := 0;
        convert := daftarbuku.listbuku[1].Judul_Buku; 
        while (i<=daftarbuku.Neff) and (found=false) do
        begin
            if (i_id_buku = daftarbuku.listbuku[i].ID_Buku) and (daftarbuku.listbuku[i].Jumlah_Buku <> 0) then
            begin  
                found := true;
                count := daftarbuku.listbuku[i].Jumlah_Buku;
                convert := daftarbuku.listbuku[i].Judul_Buku;
            end else
            begin
                i := i + 1;
            end
        end;

        {cetak ke menu}
        if found = true then
        begin
            writeln('Tersisa ', (count-1), ' buah buku ', convert, '.');
            writeln('Terimakasih sudah meminjam.');
			
			// proses batas tanggal pinjam
			hari := tanggal_pinjam.hari+7;
			bulan := tanggal_pinjam.bulan;
			tahun := tanggal_pinjam.tahun;
			if (isKabisat(tanggal_pinjam.tahun) = true) then begin
				if (isFebruari(tanggal_pinjam.bulan) = true) then begin
				 	if (hari > 29) then	begin
						hari := hari-29;
						bulan := tanggal_pinjam.bulan+1;
						tahun := tanggal_pinjam.tahun;
					end else begin
						hari := hari;
						bulan := tanggal_pinjam.bulan;
						tahun := tanggal_pinjam.tahun;
					end;
				end else if (isDesember(tanggal_pinjam.bulan) = true) then begin
					if (hari > 31) then begin
						hari := hari-31;
						bulan := 1;
						tahun := tanggal_pinjam.tahun+1;
					end else begin
						hari := hari;
						bulan := tanggal_pinjam.bulan;
						tahun := tanggal_pinjam.tahun;
					end;
				end else if (isHari30(tanggal_pinjam.bulan) = true) then begin
					if (hari > 30) then begin
						hari := hari-30;
						bulan := tanggal_pinjam.bulan+1;
						tahun := tanggal_pinjam.tahun;
					end else begin
						hari := hari;
						bulan := tanggal_pinjam.bulan;
						tahun := tanggal_pinjam.tahun;
					end;
				end else begin
					if (hari > 31) then begin
						hari := hari-31;
						bulan := tanggal_pinjam.bulan+1;
						tahun := tanggal_pinjam.tahun;
					end else begin
						hari := hari;
						bulan := tanggal_pinjam.bulan;
						tahun := tanggal_pinjam.tahun;
					end;
				end;
			end else begin
				if (isFebruari(bulan) = true) then begin
					if (hari > 28) then begin
						hari := hari-28;
						bulan := tanggal_pinjam.bulan+1;
						tahun := tanggal_pinjam.tahun;
					end else begin
						hari := hari;
						bulan := tanggal_pinjam.bulan;
						tahun := tanggal_pinjam.tahun;
					end;
				end else if (isDesember(bulan) = true) then begin
					if (hari > 31) then begin
						hari := hari-31;
						bulan := 1;
						tahun := tahun;
					end else begin
						hari := hari;
						bulan := bulan;
						tahun := tahun+1;
					end;
				end else if (isHari30(bulan) = true) then begin
					if (hari > 30) then begin
						hari := hari-30;
						bulan := tanggal_pinjam.bulan+1;
						tahun := tanggal_pinjam.tahun;
					end else begin
						hari := hari;
						bulan := tanggal_pinjam.bulan;
						tahun := tanggal_pinjam.tahun;
					end;
				end else // bulan yg jumlah hari 31
				begin
					if (hari > 31) then begin
						hari := hari-31;
						bulan := tanggal_pinjam.bulan+1;
						tahun := tanggal_pinjam.tahun;
					end else begin
						hari := hari;
						bulan := tanggal_pinjam.bulan;
						tahun := tanggal_pinjam.tahun;
					end;
				end;
			end;
			
			{ menyimpan data ke list peminjaman }
            daftarpeminjaman.Neff:= daftarpeminjaman.Neff + 1;
            daftarpeminjaman.listPeminjaman[daftarpeminjaman.Neff].Username:= username;
            daftarpeminjaman.listPeminjaman[daftarpeminjaman.Neff].ID_Buku:= i_id_buku;
            daftarpeminjaman.listPeminjaman[daftarpeminjaman.Neff].Tanggal_Peminjaman := tanggal_pinjam;
			daftarpeminjaman.listPeminjaman[daftarpeminjaman.Neff].Status_Pengembalian := 'belum';
			
			// load tanggal peminjaman
			tanggalbataspeminjaman := tanggalbataspeminjaman;
			loadTanggal (tanggalbataspeminjaman, tanggal_batas_peminjaman);
			tanggal_batas_peminjaman.hari := hari;
			tanggal_batas_peminjaman.bulan := bulan;
			tanggal_batas_peminjaman.tahun := tahun;
			// simpan ke tanggal batas pengembalian list peminjaman
            daftarpeminjaman.listPeminjaman[daftarpeminjaman.Neff].Tanggal_Batas_Pengembalian := tanggal_batas_peminjaman;
            
            { menyimpan data ke list buku }
            daftarbuku.listbuku[i].Jumlah_Buku := daftarbuku.listbuku[i].Jumlah_Buku-1;
            
			write('Batas tanggal peminjaman :  ');
			writeln(TanggalToString(tanggal_batas_peminjaman));

            
        end else begin
            writeln('Buku ', convert, ' sedang habis!');
            writeln('Coba lain kali.');    
        end;
        
	end;
          
end.
