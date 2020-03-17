UICollectionViewDelegateFlowLayout

//MARK: Constant
    let HARIZONTAL_SPCE_IMAGE: CGFloat          = 1
    let VERTICAL_SPCE_IMAGE: CGFloat            = 1
    let COLUMN_IMAGE: CGFloat                   = 4



//Mark:- CollectionViewDelegateFlowLayout Method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return HARIZONTAL_SPCE_IMAGE }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return VERTICAL_SPCE_IMAGE }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - ((COLUMN_IMAGE - 1) * HARIZONTAL_SPCE_IMAGE)) / COLUMN_IMAGE
        return CGSize(width: width, height: width)
    }

