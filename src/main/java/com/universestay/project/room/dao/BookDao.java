package com.universestay.project.room.dao;

import com.universestay.project.common.exception.CommonException;
import java.util.List;
import com.universestay.project.user.dto.BookingDto;
import com.universestay.project.user.dto.UserDto;
import java.util.Map;

public interface BookDao {

    Map<String, Object> selectRoomBookInfo(String room_id) throws CommonException;

    Integer bookRoom(BookingDto bookingDto) throws CommonException;

    Integer selectCheckBookingRoom(BookingDto bookingDto)
            throws CommonException;

    List<BookingDto> selectUnavailableDates(String room_id) throws Exception;
    UserDto getUserInfo(String userEmail) throws CommonException;
}
