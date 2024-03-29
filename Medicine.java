import java.io.*;

class Receipt {
    //privateフィールド
	private int date;
    private String merchandise;
    private int price;
    
	//コンストラクタ
    public Receipt(int d, String m, int p) {
        date = d;
        merchandise = m;
        price = p;
    }
    
	//日付を取得
    public int getDate() {
        return date;
    }
    
	//商品名を取得
    public String getMerchandise() {
        return merchandise;
    }
    
	//価格を取得
    public int getPrice() {
        return price;
    }
    
	//ファイル書き込み用
    public String getFile() {
        return date + "," + merchandise + "," + price;
    }
}

class Medicine {
    public static void main(String[] args) {
        //オブジェクト生成
    	Receipt[] receipt = {
            new Receipt(20230102, "◆パブロンゴールド", 1280),
            new Receipt(20230102, "*キリン生茶", 433),
            new Receipt(20230107, "*キリン生茶", 433),
            new Receipt(20230107, "*シマダヤ流水麺", 218),
            new Receipt(20230107, "キレイキレイ", 498),
            new Receipt(20230107, "キュキュット詰め替え用", 297),
            new Receipt(20230207, "◆パブロンゴールド", 1280),
            new Receipt(20230207, "キレイキレイ", 498),
            new Receipt(20230207, "*サントリクラフトボス", 218),
            new Receipt(20230207, "キュキュット詰め替え用", 297),
            new Receipt(20230211, "*アサヒ三ツ矢サイダー", 137),
            new Receipt(20230227, "キュキュット詰め替え用", 297),
            new Receipt(20230227, "キレイキレイ", 498),
            new Receipt(20230307, "◆パブロン鼻炎カプセル", 1280),
            new Receipt(20230307, "*サントリクラフトボス", 218),
            new Receipt(20230312, "◆パブロンゴールド", 1280),
            new Receipt(20230319, "◆パブロン鼻炎カプセル", 1280),
            new Receipt(20230319, "キュキュット詰め替え用", 297),
            new Receipt(20230319, "キレイキレイ", 498),
            new Receipt(20230325, "◆パブロン鼻炎カプセル", 1280),
            new Receipt(20230331, "◆パブロン鼻炎カプセル", 1280),
            new Receipt(20230403, "キュキュット詰め替え用", 297),
            new Receipt(20230403, "キレイキレイ", 498),
            new Receipt(20230411, "◆パブロン鼻炎カプセル", 1280),
            new Receipt(20230411, "*サントリクラフトボス", 218),
            new Receipt(20230415, "◆パブロンゴールド", 1280),
            new Receipt(20230419, "◆パブロン鼻炎カプセル", 1280),
            new Receipt(20230419, "キュキュット詰め替え用", 297),
            new Receipt(20230419, "キレイキレイ", 498),
            new Receipt(20230423, "◆パブロン鼻炎カプセル", 1280),
            new Receipt(20230429, "◆パブロン鼻炎カプセル", 1280)
        };
        
    	// ファイル指定
        String Filename = "/mnt/dev8/FILE/Medicine1";
        try {
            // ファイルへの書き込み
            BufferedWriter out = new BufferedWriter(new FileWriter(Filename));
            String lf = System.getProperty("line.separator");
            for(Receipt rec : receipt) {
                out.write(rec.getFile() + lf);
            }
            out.close();
            
            // ファイルからの読み取り
            FileReader in = new FileReader(Filename);
            BufferedReader br = new BufferedReader(in);
            System.out.println("領収書ファイル");
        	String line;
            while ((line = br.readLine()) != null) {
            	System.out.println(line);
            }
            br.close();
            
        } catch (IOException e) {
            System.out.println("ファイルが書き込み中にエラーが発生しました。");
        }
    }
}