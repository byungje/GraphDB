StartTime=$(date +%s)   # +%s 는 date의 포맷을 지정해주는 옵션이다.

gsql -g AMLSim -p 1120 "run query accountActivity()"

EndTime=$(date +%s)

echo "It takes $(($EndTime - $StartTime)) seconds to complete this task."

StartTime=$(date +%s)   # +%s 는 date의 포맷을 지정해주는 옵션이다.

gsql -g AMLSim -p 1120 "run query accountActivity_1()"

EndTime=$(date +%s)

echo "It takes $(($EndTime - $StartTime)) seconds to complete this task."
