import UIKit

public extension UITableView {

  public func performUpdates(records: [DeltaCollectionRecord]) {
    for record in records {
      let indexPath = NSIndexPath(forRow: record.index, inSection: record.section)
      switch record.type {
      case .AddItem:
        self.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      case .RemoveItem:
        self.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      case .MoveItem:
        let fromIndexPath = NSIndexPath(forRow: record.fromIndex, inSection: record.section)
        self.moveRowAtIndexPath(fromIndexPath, toIndexPath: indexPath)
      case .ChangeItem, .ReloadItem:
        self.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      case .ReloadSection:
        self.reloadSections(NSIndexSet(index: record.section), withRowAnimation: .Automatic)
      case .MoveSection:
        self.moveSection(record.fromIndex, toSection: record.index)
      case .AddSection:
        self.insertSections(NSIndexSet(index: record.section), withRowAnimation: .Automatic)
      case .RemoveSection:
        self.deleteSections(NSIndexSet(index: record.section), withRowAnimation: .Automatic)
      }
    }
  }
  
}