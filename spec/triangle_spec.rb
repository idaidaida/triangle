require File.expand_path(File.dirname(__FILE__) + "/../triangle")
require "spec_helper"

describe "Triangle" do
    describe "#type" do

        describe "引数の数チェック" do
            it "引数の数が０個の場合、エラー" do
                input = ""
                expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                expect(`ruby triangle.rb`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")            
            end
            it "引数の数が２個の場合、エラー" do
                input = "1, 2"
                expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")            
            end
            it "引数の数が３個の場合、エラー無し" do
                input = "1, 2, 3"
                expect(`ruby triangle.rb #{input}`).not_to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")            
            end
            it "引数の数が４個の場合、エラー" do
                input = "1, 2, 3, 4"
                expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
            end
        end

        describe "引数のフォーマットチェック" do
            context "引数がカンマ区切りじゃない場合" do
                it "エラーになること" do
                    input = "1, 2 3"
                    expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end
            end
            context "引数が正の整数じゃない場合" do
                it "全角が含まれる場合、エラー" do
                    input_1 = "1, 2, あ"
                    input_2 = "1, ２, 1"
                    input_3 = "＃, 2, 1"
                    expect(`ruby triangle.rb #{input_1}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                    expect(`ruby triangle.rb #{input_2}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                    expect(`ruby triangle.rb #{input_3}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end
                it "数字じゃない場合、エラー" do
                    input_1 = "1, 2, ｱ"
                    input_2 = "1, ２, #"
                    expect(`ruby triangle.rb #{input_1}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                    expect(`ruby triangle.rb #{input_2}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")               
                end
                it "負の値の場合、エラー" do
                    input = "-1, 3, 4"
                    expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end
                it "整数じゃない場合、エラー" do
                    input = "1.2, 3, 4"
                    expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end
                specify "0の場合、エラーにならないこと" do
                    input = "0, 0, 0"
                    expect(`ruby triangle.rb #{input}`).not_to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end
            end
            context "引数にスペースが含まれる場合" do
                it "前後に半角スペースが含まれる場合、トリムしてから入力フォーマットのチェックを行うこと" do
                    input = "1, 2 , 3"
                    expect(`ruby triangle.rb #{input}`).not_to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end
                it "途中に半角スペースが含まれる場合、トリムせずに入力フォーマットのチェックを行いエラーになること" do
                    input = "1, 2 3, 4"
                    expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end
                it "全角スペースが含まれる場合は、トリムせずに入力フォーマットのチェックを行いエラーになること" do
                    input = "1,　2,　3"
                    expect(`ruby triangle.rb #{input}`).to eq("[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。\n")
                end 
            end
        end
        
        describe "三角形の成立条件チェック" do
            it "a + b < cの場合、三角形不成立" do
                input = "1, 1, 3"
                expect(`ruby triangle.rb #{input}`).to eq("三角形じゃないです＞＜\n")
            end
            it "a + b = cの場合、三角形不成立" do
                input = "1, 1, 2"
                expect(`ruby triangle.rb #{input}`).to eq("三角形じゃないです＞＜\n")         
            end
            it "b + c < aの場合、三角形不成立" do
                input = "1, 4, 2"
                expect(`ruby triangle.rb #{input}`).to eq("三角形じゃないです＞＜\n")         
            end
            it "b + c = aの場合、三角形不成立" do
                input = "4, 2, 2"
                expect(`ruby triangle.rb #{input}`).to eq("三角形じゃないです＞＜\n")         
            end
            it "c + a < bの場合、三角形不成立" do
                input = "2, 6, 3"
                expect(`ruby triangle.rb #{input}`).to eq("三角形じゃないです＞＜\n")         
            end
            it "c + a = bの場合、三角形不成立" do
                input = "3, 7, 4"
                expect(`ruby triangle.rb #{input}`).to eq("三角形じゃないです＞＜\n")         
            end

            specify "a=0,b=0,c=0の場合、三角形不成立" do
                input = "0, 0, 0"
                expect(`ruby triangle.rb #{input}`).to eq("三角形じゃないです＞＜\n")
            end
        end

        describe "三角形の特徴をチェック" do
            it "全ての辺の長さが等しい場合、正三角形" do
                input = "5, 5, 5"
                expect(`ruby triangle.rb #{input}`).to eq("正三角形ですね！\n")
            end
            it "１辺目と２辺目の長さがだけ等しい場合、２等辺三角形" do
                input = "5, 5, 3"
                expect(`ruby triangle.rb #{input}`).to eq("二等辺三角形ですね！\n")
            end
            it "２辺目と３辺目の長さだけ等しい場合、２等辺三角形" do
                input = "5, 4, 4"
                expect(`ruby triangle.rb #{input}`).to eq("二等辺三角形ですね！\n")
            end
            it "３辺目と１辺目の長さだけ等しい場合、２等辺三角形" do
                input = "5, 4, 5"
                expect(`ruby triangle.rb #{input}`).to eq("二等辺三角形ですね！\n")
            end
            it "全ての長さが等しくない場合、不等辺三角形" do
                input = "5, 4, 3"
                expect(`ruby triangle.rb #{input}`).to eq("不等辺三角形ですね！\n")
            end
        end
    end
end
