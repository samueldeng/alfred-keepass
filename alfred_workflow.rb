# encoding: utf-8

class AlfredXmlFormatter
    def initialize()
        @keepass_items = []
    end

    def add_kp(kp)
        @keepass_items << kp
    end
    
    def to_string()
        kp_item_template = 
        '<item uid="home" valid="YES" autocomplete="Home Folder" type="file">
            <title>%s</title>
            <subtitle>%s %s</subtitle>
            <text type="copy">%s</text>
            <icon type="fileicon">~/</icon>
            <arg>~/</arg>
        </item>'

        string_buffer = ''
        @keepass_items.each { |kp| 
            string_buffer += kp_item_template % [kp.title, kp.username, “******”, “******”]
        }

        xml_template = 
        '<?xml version="1.0" encoding="UTF-8"?>
        <items>
        %s
        </items>'
        return xml_template % [string_buffer]
    end
end


class KeepassItem
    def initialize(title, username, password)
        @title = title
        @username = username
        @password = password
    end

    def title
        @title
    end

    def username
        @username
    end

    def password
        @password
    end
end

# kp_i_1 = KeepassItem.new("小木虫", "samueldeng", "222222")
# kp_i_2 = KeepassItem.new("小木虫2", "samueldeng2", "33333")
# kp_i_3 = KeepassItem.new("小木虫3", "samueldeng3", "44444")

# alfred_xml = AlfredXmlFormatter.new
# alfred_xml.add_kp(kp_i_1)
# alfred_xml.add_kp(kp_i_2)
# alfred_xml.add_kp(kp_i_3)

# puts alfred_xml.to_string
