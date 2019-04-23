Unit F07;

interface
    uses F13, typelist;
    procedure lapor_hilang (var Buku_Hilang:List_Buku_Hilang; username:string); 
    { Prosedur yang menerima input dari user berupa id, 
    judul, dan tanggal laporan buku yang hilang, 
    kemudian menyimpannya ke array buku hilang }

implementation
    procedure lapor_hilang (var Buku_Hilang:List_Buku_Hilang; username:string);
    { Prosedur yang menerima input dari user berupa id, 
    judul, dan tanggal laporan buku yang hilang, 
    kemudian menyimpannya ke array buku hilang }

    // KAMUS LOKAL 
    var
        id:integer;
        judul:string;
        tanggal_lapor:string;
        tanggal1: tanggal;

    // ALGORITMA 
    begin
        // Input dari user 
        write('Masukkan id buku: ');
        readln(id); 
        write('Masukkan judul buku: ');
        readln(judul);
        write('Masukkan tanggal pelaporan: ');
        readln(tanggal_lapor);
        // Memasukkan input dari user ke array buku hilang dengan index + 1 
        // diasumsikan ID, judul, dan format tanggal pelaporan valid 
        Buku_Hilang.Neff:=Buku_Hilang.Neff+1;
        Buku_Hilang.listBuku_Hilang[Buku_Hilang.Neff].Username:=username;
        Buku_Hilang.listBuku_Hilang[Buku_Hilang.Neff].ID_Buku_Hilang:=id;
        loadTanggal(tanggal_lapor, tanggal1);
        Buku_Hilang.listBuku_Hilang[Buku_Hilang.Neff].Tanggal_Laporan:=tanggal1;
    end;
end.
