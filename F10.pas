unit F10; { menu pengembalian buku, load file peminjaman }

interface
    uses typelist;
    procedure penambahan_buku(penambahanbuku: List_Buku);

implementation
    var
        i, count, i_id_buku, i_jumlah_tambah : integer;
        convert : string;

    procedure penambahan_buku(penambahanbuku: List_Buku);
    {I.S penambahanbuku terdefenisi}
	{F.S Menambahkan jumlah buku yang ada dalam List_Buku yang sudah terdefinisi}
    begin
        write('Masukkan ID Buku: '); readln(i_id_buku);
        write('Masukkan jumlah buku yang ditambahkan: '); readln(i_jumlah_tambah);

        { cari id buku, jika ditemukan maka cari jumlah buku tersebut dan convert id buku menjadi judul buku }
        i := 1;
        convert := penambahanbuku.listbuku[1].Judul_Buku;
        while (i <= penambahanbuku.Neff) and (i_id_buku <> penambahanbuku.listbuku[i].ID_Buku) do
        begin
            if i_id_buku = penambahanbuku.listbuku[i].ID_Buku then
            begin  
                
                convert := penambahanbuku.listbuku[i].Judul_Buku;
            end else
            begin
                i := i + 1;
            end;
        end;

		count := penambahanbuku.listbuku[i].Jumlah_Buku;
        writeln('Pembaharuan jumlah buku berhasil dilakukan, total buku ', convert, ' di perpustakaan menjadi ', (count + i_jumlah_tambah) );
        
        { menambahkan jumlah buku ke list buku ke-i }
        penambahanbuku.listbuku[i].Jumlah_Buku := penambahanbuku.listbuku[i].Jumlah_Buku+ i_jumlah_tambah;
        
    end;
end.
