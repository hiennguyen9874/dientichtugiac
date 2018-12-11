# Tính diện tích tứ giác qua toạ độ bốn đỉnh
## Ý tưởng làm bài
* Chọn 3 điểm trong bốn điểm A, B, C, D sẽ tạo thành một tam giác.
* Tính diện tích 4 tam giác: ABC, ABD, ACD, BCD.
* Chúng ta sẽ sử dụng công thức sau để tính diện tích cho từng tam giac một khi có toạ độ ba điểm:
* ``` S_ABC = 1/2 |((xB-xA)(yC-yA) - (xC-xA)(yB-yA))|```.
* Tương tự với các tam giác khác.
* Có hai trường hợp của tứ giác là:
    + Nếu diện tích một tam giác lớn bằng tổng ba tam giác còn lại thì tứ giác là tứ giác lõm.
    + Nễu tứ giác không phải tứ giác lõm thì tứ giác đó là tứ giác lỗi.
* Tứ giác lõm:
    + Sẽ có ba trường hợp diện tích của tam giác lõm.
    + Diện tích tứ giác ABCD sẽ là diện tích tam giác lớn nhât trừ đi ba tam giác nhỏ cộng lại.
* Tứ giác lồi:
    + Diện tích tứ giác sẽ bằng diện tích bốn tam giác nhỏ cộng lại chia đôi.