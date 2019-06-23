class Triangle

    # メッセージ定義
    INVALID_INPUTS = "[ERROR] 辺の長さは、カンマ区切りで入力してください。辺の長さは、半角で正の整数で入力してください。"
    NOT_TRIANGLE = "三角形じゃないです＞＜"
    REGULAR_TRIANGLE = "正三角形ですね！"
    ISOSCELES_TRIANGLE = "二等辺三角形ですね！"
    IRREGULAR_TRIANGLE = "不等辺三角形ですね！"
   
    # 三角形の形を応答する
    def self.type(input)
        # 入力をカンマ区切りでパースする
        sides = split_by_comma(input)

        # 入力チェック
        return puts(INVALID_INPUTS) if !(sides.length == 3)
        return puts(INVALID_INPUTS) if !positive_integer?(sides)

        # 三角形の性質を応答
        a = sides[0].to_i
        b = sides[1].to_i
        c = sides[2].to_i

        return puts(NOT_TRIANGLE) if !triangle?(a,b,c)
        return puts(REGULAR_TRIANGLE)  if a == b && b == c
        return puts(ISOSCELES_TRIANGLE) if a == b || b == c || c == a
        return puts(IRREGULAR_TRIANGLE)
    end

    private
        # スペース区切りの配列をカンマ区切りに変換して、配列を取得する
        def self.split_by_comma(sides)
            sides = sides.join(" ")
            sides = sides.split(",")
            sides = sides.map do |side|
                side.strip
            end
        end

        # 三角形の成立条件を満たす場合true
        def self.triangle?(side_a,side_b,side_c)
            return (side_a + side_b > side_c) && (side_b + side_c > side_a) && (side_c + side_a > side_b)
        end

        # 正の整数しか含まない場合true
        def self.positive_integer?(sides)
            sides.each do |side|
                return false if !(side =~ /^[0-9]+$/)
            end
        end

    # 直接呼び出し用
    if __FILE__ == $0
        type(ARGV)
    end
end
