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










#define HARIZONTAL_SPCE_IMAGE           8
#define VERTICAL_SPCE_IMAGE             8
#define COLUMN_IMAGE                    2







#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath  {
    if([arrScratchCard count]){
        CGFloat widthImage = (collectionView.frame.size.width - ((COLUMN_IMAGE - 1) * HARIZONTAL_SPCE_IMAGE)) / COLUMN_IMAGE;
        return CGSizeMake(widthImage, widthImage);
    }
    return CGSizeMake(0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if([arrScratchCard count]){
        return HARIZONTAL_SPCE_IMAGE;
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if([arrScratchCard count]){
        return VERTICAL_SPCE_IMAGE;
    }
    return 0;
}
