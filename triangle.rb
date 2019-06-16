class Triangle
   
    # 三角形の種類を回答
    def self.triangle_type(stdin)
        if stdin.length == 0
            raise SystemExit.new(1,"引数が入力されていません。")
        end


    rescue SystemExit => e
        puts e.message       
    end


    # 直接呼び出し用
    if __FILE__ == $0
        analyze_triangle_type(ARGV)
    end


end