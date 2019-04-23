unit F08;

interface
    uses typelist,F13;
    procedure lihat_laporan (var Buku_Hilang:List_Buku_Hilang; var Buku:List_Buku);
    { Prosedur ini mencetak buku-buku apa saja yang pernah dilaporkan 
    sebagai buku hilang yang tersimpan di array buku hilang } 

implementation
    procedure lihat_laporan (var Buku_Hilang:List_Buku_Hilang; var Buku:List_Buku);
    { Prosedur ini mencetak buku-buku apa saja yang pernah dilaporkan 
    sebagai buku hilang yang tersimpan di array buku hilang } 

    // KAMUS LOKAL
    var
        i,j,id:integer;
        judul:string;

    // ALGORITMA 
    begin
        // input dari user 
        writeln('Buku yang hilang :');
        for i:=1 to Buku_Hilang.Neff do 
        begin
            for j:=1 to Buku.Neff do 
            // Menggunakan 2 looping agar array List Buku Hilang dan List Buku dapat disearch
            // untuk mencari judul buku dari array List Buku, karena tidak ada judul di array List Buku Hilang 
            begin 
                if Buku_Hilang.listBuku_Hilang[i].ID_Buku_Hilang = Buku.listbuku[j].ID_Buku then
                begin
                judul:=Buku.listbuku[j].Judul_Buku;
                id:=Buku_Hilang.listBuku_Hilang[i].ID_Buku_Hilang;
                // Mengeluarkan ID, Judul, serta tanggal pelaporan buku-buku yang hilang 
                writeln(id,' | ',judul,' | ',Buku_Hilang.listBuku_Hilang[i].Tanggal_Laporan.hari,'/',Buku_Hilang.listBuku_Hilang[i].Tanggal_Laporan.bulan,'/',Buku_Hilang.listBuku_Hilang[i].Tanggal_Laporan.tahun);
                end; // else do nothing 
            end;
        end;
    end;
end.