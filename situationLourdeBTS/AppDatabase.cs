using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace situationLourdeBTS
{
    public class AppDatabase : StringDictionary, IXmlSerializable
    {
        public XmlSchema GetSchema()
        {
            return null;
        }

        public void ReadXml(XmlReader reader)
        {
            while (reader.Read() &&
                !(reader.NodeType == XmlNodeType.EndElement && reader.LocalName == this.GetType().Name))
            {
                var name = reader["Name"];
                if (name == null)
                    throw new FormatException();

                var value = reader["ConnectionString"];
                this[name] = value;
            }
        }

        public void WriteXml(XmlWriter writer)
        {
            foreach (var key in Keys)
            {
                writer.WriteStartElement("Pair");
                writer.WriteAttributeString("Name", (string)key);
                writer.WriteAttributeString("ConnectionString", this[(string)key]);
                writer.WriteEndElement();
            }
        }

        
    }
}
