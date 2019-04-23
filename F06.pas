unit F06; // menu pengembalian buku, load file peminjaman

interface
    uses typelist, F13, F02;
    procedure pengembalianbuku(var daftarbuku: List_Buku;var daftarpengembalian : List_Pengembalian;var daftarpeminjaman : List_Peminjaman; username : String);
    function isLate (x,y: integer): boolean;

implementation
     var
        i_id_buku, i, k, count1 : integer;
        found, found1 : boolean;
        convert : String;
        tanggalhariini : String;
        tanggal_hari_ini : tanggal;

    function isLate (x,y: integer): boolean;
    {I.S x,y terdefenisi}
	{F.S Mengasilkan boolean dari x,y yang sudah terdefinisi}
    begin
        if (x>y) then
            isLate := true
        else   
            isLate := false
    end;
    
    procedure pengembalianbuku(var daftarbuku: List_Buku;var daftarpengembalian : List_Pengembalian;var daftarpeminjaman : List_Peminjaman; username : String);
    {I.S daftarbuku, daftarpengembalian, daftarpeminjaman, dan username terdefenisi}
	{F.S Melakukan prosedur pengembalian buku dari parameter yang sudah terdefinisi}
    begin
        write('Masukkan id buku yang dikembalikan: ');
        readln(i_id_buku);

        { cek buku di list peminjaman }
        i := 1;
        found := false;
        while (i <= daftarpeminjaman.Neff) and (found=false) do
        begin
            if (i_id_buku = daftarpeminjaman.listPeminjaman[i].ID_Buku) and (username = daftarpeminjaman.listPeminjaman[i].Username) then
            begin  
                found := true; //ditemukan bila list pengembalian bernilai false atau belum dikembalikan
            end else
            begin
                i := i + 1;
            end
        end;
        
        { cek buku yang ada di listbuku }
        k := 1;
        found1 := false;
        convert := daftarbuku.listbuku[1].Judul_Buku; 
        while (k<=daftarbuku.Neff) and (found1=false) do
        begin
            if (i_id_buku = daftarbuku.listbuku[k].ID_Buku) then
            begin  
                found1 := true;
                convert := daftarbuku.listbuku[k].Judul_Buku;
            end else
            begin
                k := k + 1;
            end
        end;

        { load data peminjaman }
        if (found = true) then // 
        begin
            writeln('Data Peminjaman:');
            write('Username: '); writeln(daftarpeminjaman.listPeminjaman[i].Username);
            write('Judul buku: '); writeln(convert);
            write('Tanggal peminjaman: ');
            writeln(TanggalToString(daftarpeminjaman.listPeminjaman[i].Tanggal_Peminjaman));
            write('Tanggal batas pengembalian: ');
            writeln(TanggalToString(daftarpeminjaman.listPeminjaman[i].Tanggal_Batas_Pengembalian));
			write('Masukkan tanggal hari ini: ');
			read(tanggalhariini);
			loadTanggal(tanggalhariini, tanggal_hari_ini);
						          
			{ update daftar peminjaman }
			daftarpeminjaman.listPeminjaman[i].Status_Pengembalian := 'sudah';
                        					
			{ menyimpan ke daftar pengembalian }
			daftarpeminjaman.Neff:= daftarpeminjaman.Neff + 1;
			daftarpengembalian.listPengembalian[daftarpeminjaman.Neff].Username := username;
			daftarpengembalian.listPengembalian[daftarpeminjaman.Neff].ID_Buku := i_id_buku;
			daftarpengembalian.listPengembalian[daftarpeminjaman.Neff].Tanggal_Pengembalian := tanggal_hari_ini;

			// menambahkan jumlah buku yang dipinjam ke list buku
            // update jumlah buku di list buku 
            count1 := daftarbuku.listbuku[k].Jumlah_Buku;
			daftarbuku.listbuku[k].Jumlah_Buku := count1-1;
         
            { cek telat atau tidak, pengembalian tidak dianggap telat jika tahun, bulan, dan tanggal tidak terlambat
              selain itu semuanya terlambat }
            if (isLate(tanggal_hari_ini.tahun, daftarpeminjaman.listPeminjaman[i].Tanggal_Batas_Pengembalian.tahun ) = false) then
            begin //bila tahunnya terlambat maka
                if (isLate(tanggal_hari_ini.bulan, daftarpeminjaman.listPeminjaman[i].Tanggal_Batas_Pengembalian.bulan) = false) then
                begin
                    if (isLate(tanggal_hari_ini.hari, daftarpeminjaman.listPeminjaman[i].Tanggal_Batas_Pengembalian.hari) = false) then
                    begin // tanggalnya tidak terlambat
                        writeln('Terimakasih sudah meminjam.');

                    end else // tahun dan bulan tidak terlambat, namun tanggal terlambat
                    begin
                        writeln('Anda terlambat mengembalikan buku');
                    end
                end else // bulannya terlambat, maka otomatis terlambat
                begin
                    writeln('Anda terlambat mengembalikan buku');
                end
            end else // tahunnya terlambat, maka otomatis terlambat
            begin
                writeln('Anda terlambat mengembalikan buku');
            end
		
		
		
		// diasumsikan pengunjung yang membuka menu ini meminjam buku
        { optional buat fungsi denda }
        end

    end;
end.
