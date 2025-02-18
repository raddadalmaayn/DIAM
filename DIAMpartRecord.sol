// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DIAMPartRecord {
    
    // Struct representing a production or supply chain event
    struct Event {
        string eventType;   // E.g., "PrintStarted", "PrintCompleted", "QualityChecked"
        string eventData;   // Additional event details (could be a JSON string)
        uint256 timestamp;  // Time the event was recorded
        address actor;      // The address of the entity that logged the event
    }
    
    // Struct representing the digital part record (the digital twin)
    struct PartRecord {
        uint256 partId;         // Unique identifier for the part
        address manufacturer;   // Address of the manufacturer who created the record
        string description;     // Description of the part
        string dataHash;        // Off-chain reference (e.g., IPFS CID) to detailed data
        uint256 creationTime;   // Timestamp when the record was created
        Event[] events;         // Array of events logged during the part's lifecycle
    }
    
    // Mapping from part ID to its corresponding record
    mapping(uint256 => PartRecord) private partRecords;
    
    // Events emitted for on-chain logging
    event PartRecordCreated(uint256 indexed partId, address indexed manufacturer, uint256 creationTime);
    event PartRecordUpdated(uint256 indexed partId, string eventType, string eventData, uint256 timestamp, address indexed actor);
    
    // Create a new digital part record. The sender becomes the manufacturer.
    function createPartRecord(uint256 _partId, string calldata _description, string calldata _dataHash) external {
        require(partRecords[_partId].creationTime == 0, "Part record already exists");
        PartRecord storage newRecord = partRecords[_partId];
        newRecord.partId = _partId;
        newRecord.manufacturer = msg.sender;
        newRecord.description = _description;
        newRecord.dataHash = _dataHash;
        newRecord.creationTime = block.timestamp;
        emit PartRecordCreated(_partId, msg.sender, block.timestamp);
    }
    
    // Add an event to an existing part record
    function addEvent(uint256 _partId, string calldata _eventType, string calldata _eventData) external {
        require(partRecords[_partId].creationTime != 0, "Part record does not exist");
        partRecords[_partId].events.push(Event({
            eventType: _eventType,
            eventData: _eventData,
            timestamp: block.timestamp,
            actor: msg.sender
        }));
        emit PartRecordUpdated(_partId, _eventType, _eventData, block.timestamp, msg.sender);
    }
    
    // Retrieve the number of events recorded for a part
    function getEventsCount(uint256 _partId) external view returns (uint256) {
        require(partRecords[_partId].creationTime != 0, "Part record does not exist");
        return partRecords[_partId].events.length;
    }
    
    // Retrieve a specific event from a part record by index
    function getEvent(uint256 _partId, uint256 _index) external view returns (string memory, string memory, uint256, address) {
        require(partRecords[_partId].creationTime != 0, "Part record does not exist");
        require(_index < partRecords[_partId].events.length, "Invalid event index");
        Event memory evt = partRecords[_partId].events[_index];
        return (evt.eventType, evt.eventData, evt.timestamp, evt.actor);
    }
    
    // Retrieve basic information about a part record (excluding detailed events)
    function getPartRecord(uint256 _partId) external view returns (uint256, address, string memory, string memory, uint256) {
        require(partRecords[_partId].creationTime != 0, "Part record does not exist");
        PartRecord memory record = partRecords[_partId];
        return (record.partId, record.manufacturer, record.description, record.dataHash, record.creationTime);
    }
}
