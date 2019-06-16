require File.expand_path(File.dirname(__FILE__) + '/../triangle')
require "spec_helper"

describe "[Triangle]" do
    describe "[#triangle_type]" do

        context "[標準入力の数を確認]" do
            it "入力が無い場合にエラーになること" do
                input = []
                expect{Triangle.triangle_type(input)}.to output("引数が入力されていません。\n").to_stdout
            end
            it "入力が１個の場合にエラーにならないこと" do
                input = ["1"]
                expect{Triangle.triangle_type(input)}.not_to output("引数が入力されていません。\n").to_stdout
            end
            specify "入力が２個以上の場合にエラーにならないこと" do
                input = ["1","2"]
                expect{Triangle.triangle_type(input)}.not_to output("引数が入力されていません。\n").to_stdout
            end
        end

        context "[解析対象の辺の数を確認]" do
            it "解析対象の辺が３つ無い場合にエラーになること"
            it "解析対象の辺が３つの場合にエラーにならないこと"
            specify "解析対象の辺が４つ以上ある場合、エラーならないこと（最初の３辺を使って処理を継続）"
        end

        context "[解析対象の辺の長さのフォーマットを確認]" do
            it "入力値が数字じゃないときにエラーになること"
            it "入力値が数字のときにエラーにならないこと"
             it "入力値が整数じゃないときにエラーになること"
            it "前後にスペースがある場合にトリムして、フォーマットの確認を行うこと"
        end

        context "[三角形の解析]" do
            it "三角形の成立条件を満たさない時、’三角形じゃありません'と応答すること"
            it "三角形の成立条件を満たして３辺が等しい時、'正三角形ですね'と応答すること"
            it "三角形の成立条件を満たして２辺のみ等しい時、'二等三角形ですね'と応答すること"
            it "三角形の成立条件を満たして全ての辺の長さが等しくない時、'不等辺三角形ですね'と応答すること"
            it "前後にスペースがある場合にトリムして、三角形の解析を行うこと"
        end
    end
end
