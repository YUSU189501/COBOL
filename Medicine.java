import java.io.*;

class MedIcine {
	public static void main(String[] args) {
		String Filename = "/home/suzuki/DATA/Medicine1";
		try {
			FileWriter out = new FileWriter(Filename);
			String lf = System.getProperty("line.separator");
			out.write("20230102,◆パブロンゴールド,1280" + lf);
			out.write("20230102,*キリン生茶,433" + lf);
			out.write("20230107,*キリン生茶,433" + lf);
			out.write("20230107,*シマダヤ 流水麺,218" + lf);
			out.write("20230107,キレイキレイ,498" + lf);
			out.write("20230107,キュキュット詰め替え用,297" + lf);
			out.write("20230207,◆パブロンゴールド,1280" + lf);
			out.write("20230207,キレイキレイ,498" + lf);
			out.write("20230207,*サントリクラフトボス,218" + lf);
			out.write("20230207,キュキュット詰め替え用,297" + lf);
			out.write("20230211,*アサヒ 三ツ矢サイダー,137" + lf);
			out.write("20230227,キュキュット詰め替え用,297" + lf);
			out.write("20230227,キレイキレイ,498" + lf);
			out.write("20230307,◆パブロン鼻炎カプセル,1280" + lf);
			out.write("20230307,*サントリクラフトボス,218" + lf);
			out.write("20230312,◆パブロンゴールド,1280" + lf);
			out.write("20230319,◆パブロン鼻炎カプセル,1280" + lf);
			out.write("20230319,キュキュット詰め替え用,297" + lf);
			out.write("20230319,キレイキレイ,498" + lf);
			out.write("20230325,◆パブロン鼻炎カプセル,1280" + lf);
			out.write("20230331,◆パブロン鼻炎カプセル,1280" + lf);
			out.write("20230403,キュキュット詰め替え用,297" + lf);
			out.write("20230403,キレイキレイ,498" + lf);
			out.write("20230411,◆パブロン鼻炎カプセル,1280" + lf);
			out.write("20230411,*サントリクラフトボス,218" + lf);
			out.write("20230415,◆パブロンゴールド,1280" + lf);
			out.write("20230419,◆パブロン鼻炎カプセル,1280" + lf);
			out.write("20230419,キュキュット詰め替え用,297" + lf);
			out.write("20230419,キレイキレイ,498" + lf);
			out.write("20230423,◆パブロン鼻炎カプセル,1280" + lf);
			out.write("20230429,◆パブロン鼻炎カプセル,1280" + lf);
			out.close();
		} catch (IOException e) {
			System.out.println(e);
		}
	}
}
