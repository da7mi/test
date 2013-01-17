module ApplicationHelper
end

class String
    def truncate(n)
      slice(/^.{0,#{n}}/m) + (nchar > n ? "..." : "")
    end

    def nchar
      split(//).size
    end

    def nl2br
      gsub(/(\r\n|\r|\n)/, "<br />")
    end
end
