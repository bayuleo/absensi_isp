class PagingController<T> {
  List<T> listItems = [];
  int pageNumber = 0;
  bool isLoadingPage = false;
  bool isLoadingLoadMore = false;
  bool endOfList = false;
  get offset => listItems.length;

  initRefresh() {
    listItems = [];
    pageNumber = 0;
    isLoadingPage = false;
    isLoadingLoadMore = false;
    endOfList = false;
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !endOfList;
  }

  appendPage(List<T> items) {
    listItems.addAll(items);
    pageNumber++;
  }

  appendLastPage(List<T> items) {
    listItems.addAll(items);
    endOfList = true;
  }
}
