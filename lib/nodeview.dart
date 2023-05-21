
class NodeID
{
  NodeID(int id)
  :
  _id = id;

  int id() {
    return _id;
  }
  
  final int _id;
}

enum DataType {
  typeNone,
  typeInt,
  typeDoule,
  typeString,
  typeBool
}

class PortView {
  void setName(String name) {
    _name = name;
  }
  String name() {
    return _name;
  }

  void setType(DataType type) {
    _type = type;
  }

  DataType type() {
    return _type;
  }

  void setValue(String value) {
    _value = value;
  }

  String value() {
    return _value;
  }

  String _name = String.fromCharCode(0);
  DataType _type = DataType.typeNone;
  String _value = String.fromCharCode(0);
}

class NodeView {
  NodeView()
  :
  _nodeID = NodeID(0),
  _ports = List<PortView>.empty()
  {
    // Do nothing.
  }

  void setID(NodeID id) {
    _nodeID = id;
  }

  NodeID id() {
    return _nodeID;
  }

  void addPort(PortView port) {
    _ports.add(port);
  }

  void removePort(PortView port) {
    _ports.remove(port);
  }
  
  PortView port(int index) {
    return _ports[index];
  }

  NodeID _nodeID;
  List<PortView> _ports;
}
